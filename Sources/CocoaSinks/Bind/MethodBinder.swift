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
    func to(_ publisher: AnyPublisher<Param, Never>) {
        publisher
            .receive(on: DispatchQueue.main)
            .sink { [method, weak base] in
                guard let base = base else { return }
                method($0, base)
            }
            .store(in: &root.internalStore)
    }

    func to(_ publisher: Published<Param>.Publisher) {
        to(publisher.eraseToAnyPublisher())
    }
}
