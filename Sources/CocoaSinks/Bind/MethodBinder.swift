//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//
import UIKit
import Combine

public final class MethodBinder<Param, UnwrappedParam, Base: AnyObject> {
    typealias Method = (Param, Base) -> Void

    weak var base: Base?
    let method: Method
    let root: Bind<Base>

    init(root: Bind<Base>, method: @escaping Method) {
        self.base = root.base
        self.method = method
        self.root = root
    }
}

public extension MethodBinder {
    func cancellable(_ publisher: AnyPublisher<Param, Never>) -> AnyCancellable {
        return publisher
            .receive(on: DispatchQueue.main)
            .sink { [method, weak base] in
                guard let base = base else { return }
                method($0, base)
            }
    }
    
    func to(_ publisher: AnyPublisher<Param, Never>) {
        cancellable(publisher).store(in: &root.internalStore)
    }

    func cancellable(_ publisher: Published<Param>.Publisher) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher())
    }

    func to(_ publisher: Published<Param>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }
}

public extension MethodBinder where Param == UnwrappedParam? {
    func to(_ publisher: AnyPublisher<UnwrappedParam, Never>) {
        to(publisher.optional())
    }

    func to(_ publisher: Published<UnwrappedParam>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }
    
    func cancellable(_ publisher: AnyPublisher<UnwrappedParam, Never>) -> AnyCancellable {
        return cancellable(publisher.optional())
    }

    func cancellable(_ publisher: Published<UnwrappedParam>.Publisher) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher())
    }
}
