//
//  File.swift
//  
//
//  Created by Paul Weber on 09.04.20.
//

import Combine

extension Publisher {
    func optional() -> AnyPublisher<Self.Output?, Self.Failure> {
        return self.map { $0 as Self.Output? }.eraseToAnyPublisher()
    }
}
