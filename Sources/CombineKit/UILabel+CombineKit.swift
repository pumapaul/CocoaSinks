//
//  UILabel+CombineKit.swift
//  Searrrch
//
//  Created by Paul Weber on 08.04.20.
//

import UIKit
import Combine

public extension Binder where Base: UILabel {
    // MARK: attributedText
    
    /// The current styled text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func attributedText(_ textPublisher: AnyPublisher<NSAttributedString?, Never>, store: inout Set<AnyCancellable>) {
        textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.attributedText, on: base)
            .store(in: &store)
    }
    
    /// The current styled text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func attributedText(_ textPublisher: Published<NSAttributedString?>.Publisher, store: inout Set<AnyCancellable>) {
        attributedText(textPublisher.eraseToAnyPublisher(), store: &store)
    }
    
    /// The current styled text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func attributedText(_ textPublisher: AnyPublisher<NSAttributedString, Never>, store: inout Set<AnyCancellable>) {
        attributedText(textPublisher.optional(), store: &store)
    }
    
    /// The current styled text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func attributedText(_ textPublisher: Published<NSAttributedString>.Publisher, store: inout Set<AnyCancellable>) {
        attributedText(textPublisher.eraseToAnyPublisher(), store: &store)
    }
    
    // MARK: text
    
    /// The current text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func text(_ textPublisher: AnyPublisher<String?, Never>, store: inout Set<AnyCancellable>) {
        textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: base)
            .store(in: &store)
    }
    
    /// The current text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func text(_ textPublisher: Published<String?>.Publisher, store: inout Set<AnyCancellable>) {
        text(textPublisher.eraseToAnyPublisher(), store: &store)
    }
    
    /// The current text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func text(_ textPublisher: AnyPublisher<String, Never>, store: inout Set<AnyCancellable>) {
        text(textPublisher.optional(), store: &store)
    }
    
    /// The current text that is displayed by the label.
    /// - parameter publisher: The publisher supplying `text`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func text(_ textPublisher: Published<String>.Publisher, store: inout Set<AnyCancellable>) {
        text(textPublisher.eraseToAnyPublisher(), store: &store)
    }
}
