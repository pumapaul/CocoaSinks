//
//  File.swift
//  
//
//  Created by Paul Weber on 09.04.20.
//

import Combine

extension Publisher where Self.Failure == Never {
    /// Assigns each element from a Publisher to a property on an object.
    /// - Important: This includes a fix for the retain cycle on Apple's assign that happens when you assign to a keypath on the object that holds the resulting AnyCancellable
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the property to assign.
    ///   - object: The object on which to assign the value.
    /// - Returns: A cancellable instance; used when you end assignment of the received value. Deallocation of the result will tear down the subscription stream.
    func assign<Root: AnyObject>(to keyPath: ReferenceWritableKeyPath<Root, Output>, on root: Root) -> AnyCancellable {
       sink { [weak root] in
            root?[keyPath: keyPath] = $0
        }
    }
}

extension Publisher {
    func optional() -> AnyPublisher<Self.Output?, Self.Failure> {
        return self.map { $0 as Self.Output? }.eraseToAnyPublisher()
    }
}
