//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//
import UIKit
import Combine

public final class MethodBinder<Property, UnwrappedProperty, Base: AnyObject> {
    typealias Method = (Property, Base) -> Void

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
    func to(_ publisher: AnyPublisher<Property, Never>) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [method, weak base] in
                guard let base = base else { return }
                method($0, base)
            }
            .store(in: &root.internalStore)
    }

    func to(_ publisher: Published<Property>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }
}

public extension MethodBinder where Property == UnwrappedProperty? {
    func to(_ publisher: AnyPublisher<UnwrappedProperty, Never>) {
        to(publisher.optional())
    }

    func to(_ publisher: Published<UnwrappedProperty>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }
}

public extension MethodBinder where Property == UIImage? {
    func to(data: AnyPublisher<Data, Never>) {
        let asImage = data.map { UIImage(data: $0) }.eraseToAnyPublisher()
        to(asImage)
    }

    func to(data: AnyPublisher<Data?, Never>) {
        let unwrapped = data.map { $0 ?? Data() }.eraseToAnyPublisher()
        to(data: unwrapped)
    }

    func to(data: Published<Data>.Publisher) {
        to(data: data.eraseToAnyPublisher())
    }

    func to(data: Published<Data?>.Publisher) {
        to(data: data.eraseToAnyPublisher())
    }
}
