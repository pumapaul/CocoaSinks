//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import UIKit

public extension Bind where Base: UIControl {
    var isEnabled: PropertyBinder<Bool, Void, Base> {
        PropertyBinder(root: self, keyPath: \.isEnabled)
    }
    var isSelected: PropertyBinder<Bool, Void, Base> {
        PropertyBinder(root: self, keyPath: \.isSelected)
    }
}
