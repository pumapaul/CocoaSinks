//
//  UIView+CombineKit.swift
//  Searrrch
//
//  Created by Paul Weber on 08.04.20.
//

import UIKit
import Combine

public extension Binder where Base: UIView {
    // MARK: alpha
    
    /// The view’s alpha value.
    /// - parameter publisher: The publisher supplying `alpha`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func alpha(_ publisher: AnyPublisher<CGFloat, Never>, store: inout Set<AnyCancellable>) {
        publisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.alpha, on: base)
            .store(in: &store)
    }
    
    /// The view’s alpha value.
    /// - parameter publisher: The publisher supplying `alpha`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func alpha(_ publisher: Published<CGFloat>.Publisher, store: inout Set<AnyCancellable>) {
        alpha(publisher.eraseToAnyPublisher(), store: &store)
    }
    
    /// The view’s alpha value.
    /// - parameter publisher: The publisher supplying `alpha`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func alpha(_ publisher: AnyPublisher<Float, Never>, store: inout Set<AnyCancellable>) {
        alpha(publisher.map { CGFloat($0) }.eraseToAnyPublisher(), store: &store)
    }
    
    /// The view’s alpha value.
    /// - parameter publisher: The publisher supplying `alpha`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func alpha(_ publisher: Published<Float>.Publisher, store: inout Set<AnyCancellable>) {
        alpha(publisher.map { CGFloat($0) }.eraseToAnyPublisher(), store: &store)
    }
    
    /// The view’s alpha value.
    /// - parameter publisher: The publisher supplying `alpha`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func alpha(_ publisher: AnyPublisher<Double, Never>, store: inout Set<AnyCancellable>) {
        alpha(publisher.map { CGFloat($0) }.eraseToAnyPublisher(), store: &store)
    }
    
    /// The view’s alpha value.
    /// - parameter publisher: The publisher supplying `alpha`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func alpha(_ publisher: Published<Double>.Publisher, store: inout Set<AnyCancellable>) {
        alpha(publisher.map { CGFloat($0) }.eraseToAnyPublisher(), store: &store)
    }
    
    // MARK: backgroundColor
    
    /// The view’s background color.
    /// - parameter publisher: The publisher supplying `backgroundColor`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func backgroundColor(_ publisher: AnyPublisher<UIColor?, Never>, store: inout Set<AnyCancellable>) {
        publisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.backgroundColor, on: base)
            .store(in: &store)
    }
    
    /// The view’s background color.
    /// - parameter publisher: The publisher supplying `backgroundColor`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func backgroundColor(_ publisher: AnyPublisher<UIColor, Never>, store: inout Set<AnyCancellable>) {
        backgroundColor(publisher.optional(), store: &store)
    }
    
    /// The view’s background color.
    /// - parameter publisher: The publisher supplying `backgroundColor`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func backgroundColor(_ publisher: Published<UIColor>.Publisher, store: inout Set<AnyCancellable>) {
        backgroundColor(publisher.optional().eraseToAnyPublisher(), store: &store)
    }
    
    /// The view’s background color.
    /// - parameter publisher: The publisher supplying `backgroundColor`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func backgroundColor(_ publisher: Published<UIColor?>.Publisher, store: inout Set<AnyCancellable>) {
        backgroundColor(publisher.eraseToAnyPublisher(), store: &store)
    }
    
    //MARK: isHidden
    
    /// A Boolean value that determines whether the view is hidden.
    /// - parameter publisher: The publisher supplying `isHidden`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func isHidden(_ publisher: Published<Bool>.Publisher, store: inout Set<AnyCancellable>) {
        isHidden(publisher.eraseToAnyPublisher(), store: &store)
    }
    
    /// A Boolean value that determines whether the view is hidden.
    /// - parameter publisher: The publisher supplying `isHidden`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func isHidden(_ publisher: AnyPublisher<Bool, Never>, store: inout Set<AnyCancellable>) {
        publisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isHidden, on: base)
            .store(in: &store)
    }
    
    // MARK: isUserInteractionEnabled
    
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    /// - parameter publisher: The publisher supplying `isHidden`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func isUserInteractionEnabled(_ publisher: AnyPublisher<Bool, Never>, store: inout Set<AnyCancellable>) {
        publisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.isUserInteractionEnabled, on: base)
            .store(in: &store)
    }
    
    /// A Boolean value that determines whether user events are ignored and removed from the event queue.
    /// - parameter publisher: The publisher supplying `isHidden`
    /// - parameter store: The `Set` in which to store the `AnyCancellable` referencing the resulting `Subscription`
    func isUserInteractionEnabled(_ publisher: Published<Bool>.Publisher, store: inout Set<AnyCancellable>) {
        isUserInteractionEnabled(publisher.eraseToAnyPublisher(), store: &store)
    }
}
