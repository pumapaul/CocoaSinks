//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//
import Combine
import ObjectiveC.runtime

public final class Bind<Base: AnyObject> {
    internal weak var base: Base?
    internal var internalStore = Set<AnyCancellable>()

    init(_ base: Base) {
        self.base = base
    }
}

public protocol BindCompatible: AnyObject {
    associatedtype Base: AnyObject
    var bind: Bind<Base> { get }
}

extension BindCompatible {
    public var bind: Bind<Self> {
        if let associatedObject = objc_getAssociatedObject(self, associatedObjectKey) as? Bind<Self> {
            return associatedObject
        }
        let newObject = Bind(self)
        objc_setAssociatedObject(self, associatedObjectKey, newObject, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return newObject
    }

    var associatedObjectKey: String { "CocoaSinks.Bind" }
}

import UIKit.UIView

extension UIView: BindCompatible {}
