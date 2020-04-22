//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import UIKit
import Combine

public final class MethodBinderTwoParameters<Param, UnwrappedParam, SecondParam, Base: AnyObject> {
    typealias Method = (Param, SecondParam, Base) -> Void

    weak var base: Base?
    let method: Method
    let root: Bind<Base>

    init(root: Bind<Base>, method: @escaping Method) {
        self.base = root.base
        self.method = method
        self.root = root
    }
}

public extension MethodBinderTwoParameters where Base: UIButton, SecondParam == UIButton.State {
    func to(_ publisher: AnyPublisher<Param, Never>, for state: UIButton.State = .normal) {
        cancellable(publisher, for: state).store(in: &root.internalStore)
    }

    func to(_ publisher: Published<Param>.Publisher, for state: UIButton.State = .normal) {
        to(publisher.eraseToAnyPublisher(), for: state)
    }

    func cancellable(_ publisher: AnyPublisher<Param, Never>, for state: UIButton.State = .normal) -> AnyCancellable {
        return publisher
            .receive(on: DispatchQueue.main)
            .sink { [method, weak base] in
                guard let base = base else { return }
                method($0, state, base)
            }
    }

    func cancellable(_ publisher: Published<Param>.Publisher, for state: UIButton.State = .normal) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher(), for: state)
    }
}

public extension MethodBinderTwoParameters where Param == UnwrappedParam?, Base: UIButton, SecondParam == UIButton.State {
    func to(_ publisher: AnyPublisher<UnwrappedParam, Never>, for state: UIButton.State = .normal) {
        to(publisher.optional(), for: state)
    }

    func to(_ publisher: Published<UnwrappedParam>.Publisher, for state: UIButton.State = .normal) {
        to(publisher.eraseToAnyPublisher(), for: state)
    }

    func cancellable(_ publisher: AnyPublisher<UnwrappedParam, Never>, for state: UIButton.State = .normal) -> AnyCancellable {
        return cancellable(publisher.optional(), for: state)
    }

    func cancellable(_ publisher: Published<UnwrappedParam>.Publisher, for state: UIButton.State = .normal) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher(), for: state)
    }
}

public extension MethodBinderTwoParameters where Param == UIImage?, Base: UIButton, SecondParam == UIButton.State {
    func to(data: AnyPublisher<Data, Never>, for state: UIButton.State = .normal) {
        let asImage = data.map { UIImage(data: $0) }.eraseToAnyPublisher()
        to(asImage, for: state)
    }

    func to(data: AnyPublisher<Data?, Never>, for state: UIButton.State = .normal) {
        let unwrapped = data.map { $0 ?? Data() }.eraseToAnyPublisher()
        to(data: unwrapped, for: state)
    }

    func to(data: Published<Data>.Publisher, for state: UIButton.State = .normal) {
        to(data: data.eraseToAnyPublisher(), for: state)
    }

    func to(data: Published<Data?>.Publisher, for state: UIButton.State = .normal) {
        to(data: data.eraseToAnyPublisher(), for: state)
    }

    func cancellable(data: AnyPublisher<Data, Never>, for state: UIButton.State = .normal) -> AnyCancellable {
        let asImage = data.map { UIImage(data: $0) }.eraseToAnyPublisher()
        return cancellable(asImage, for: state)
    }

    func cancellable(data: AnyPublisher<Data?, Never>, for state: UIButton.State = .normal) -> AnyCancellable {
        let unwrapped = data.map { $0 ?? Data() }.eraseToAnyPublisher()
        return cancellable(data: unwrapped, for: state)
    }

    func cancellable(data: Published<Data>.Publisher, for state: UIButton.State = .normal) -> AnyCancellable {
        return cancellable(data: data.eraseToAnyPublisher(), for: state)
    }

    func cancellable(data: Published<Data?>.Publisher, for state: UIButton.State = .normal) -> AnyCancellable {
        return cancellable(data: data.eraseToAnyPublisher(), for: state)
    }
}
