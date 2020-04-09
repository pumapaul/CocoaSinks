//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import UIKit

public extension Bind where Base: UIView {
    var alpha: PropertyBinder<CGFloat, Void, Base> {
        PropertyBinder(root: self, keyPath: \.alpha)
    }
    var backgroundColor: PropertyBinder<UIColor?, UIColor, Base> {
        PropertyBinder(root: self, keyPath: \.backgroundColor)
    }
    var isHidden: PropertyBinder<Bool, Void, Base> {
        PropertyBinder(root: self, keyPath: \.isHidden)
    }
    var isUserInteractionEnabled: PropertyBinder<Bool, Void, Base> {
        PropertyBinder(root: self, keyPath: \.isUserInteractionEnabled)
    }
}
