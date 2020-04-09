//
//  Binder.swift
//  Searrrch
//
//  Created by Paul Weber on 08.04.20.
//

public struct Binder<Base> {
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol BinderCompatible {
    associatedtype Base
    var bind: Binder<Base> { get }
}

extension BinderCompatible {
    public var bind: Binder<Self> { Binder(self) }
}

import UIKit.UIView

extension UIView: BinderCompatible {}
