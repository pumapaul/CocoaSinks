//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//
import UIKit
import Combine

public final class PropertyBinder<Property, UnwrappedProperty, Base: AnyObject> {
    typealias PropertyKeyPath = ReferenceWritableKeyPath<Base, Property>

    weak var base: Base?
    let keyPath: PropertyKeyPath
    let root: Bind<Base>

    init(root: Bind<Base>, keyPath: PropertyKeyPath) {
        self.base = root.base
        self.keyPath = keyPath
        self.root = root
    }
}

public extension PropertyBinder {
    func to(_ publisher: AnyPublisher<Property, Never>) {
        cancellable(publisher).store(in: &root.internalStore)
    }

    func to(_ publisher: Published<Property>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }

    func cancellable(_ publisher: AnyPublisher<Property, Never>) -> AnyCancellable {
        publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {[keyPath, weak base] (newVal) in
                guard let base = base else { return }
                base[keyPath: keyPath] = newVal
            })
    }

    func cancellable(_ publisher: Published<Property>.Publisher) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher())
    }
}

public extension PropertyBinder where Property == UnwrappedProperty? {
    func to(_ publisher: AnyPublisher<UnwrappedProperty, Never>) {
        to(publisher.optional())
    }

    func to(_ publisher: Published<UnwrappedProperty>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }

    func cancellable(_ publisher: AnyPublisher<UnwrappedProperty, Never>) -> AnyCancellable {
        return cancellable(publisher.optional())
    }

    func cancellable(_ publisher: Published<UnwrappedProperty>.Publisher) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher())
    }
}

public extension PropertyBinder where Property == CGFloat {
    func to(_ publisher: AnyPublisher<Float, Never>) {
        let asCGFloat = publisher.map { CGFloat($0) }.eraseToAnyPublisher()
        to(asCGFloat)
    }

    func to(_ publisher: Published<Float>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }

    func to(_ publisher: AnyPublisher<Double, Never>) {
        let asCGFloat = publisher.map { CGFloat($0) }.eraseToAnyPublisher()
        to(asCGFloat)
    }

    func to(_ publisher: Published<Double>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }

    func cancellable(_ publisher: AnyPublisher<Float, Never>) -> AnyCancellable {
        let asCGFloat = publisher.map { CGFloat($0) }.eraseToAnyPublisher()
        return cancellable(asCGFloat)
    }

    func cancellable(_ publisher: Published<Float>.Publisher) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher())
    }

    func cancellable(_ publisher: AnyPublisher<Double, Never>) -> AnyCancellable {
        let asCGFloat = publisher.map { CGFloat($0) }.eraseToAnyPublisher()
        return cancellable(asCGFloat)
    }

    func cancellable(_ publisher: Published<Double>.Publisher) -> AnyCancellable {
        return cancellable(publisher.eraseToAnyPublisher())
    }
}

public extension PropertyBinder where Property == UIImage? {
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

    func cancellable(data: AnyPublisher<Data, Never>) -> AnyCancellable {
        let asImage = data.map { UIImage(data: $0) }.eraseToAnyPublisher()
        return cancellable(asImage)
    }

    func cancellable(data: AnyPublisher<Data?, Never>) -> AnyCancellable {
        let unwrapped = data.map { $0 ?? Data() }.eraseToAnyPublisher()
        return cancellable(data: unwrapped)
    }

    func cancellable(data: Published<Data>.Publisher) -> AnyCancellable {
        return cancellable(data: data.eraseToAnyPublisher())
    }

    func cancellable(data: Published<Data?>.Publisher) -> AnyCancellable {
        return cancellable(data: data.eraseToAnyPublisher())
    }
}
