//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import UIKit

public extension Bind where Base: UISlider {
    var minimumValue: PropertyBinder<Float, Void, Base> {
        PropertyBinder(root: self, keyPath: \.minimumValue)
    }
    var maximumValue: PropertyBinder<Float, Void, Base> {
        PropertyBinder(root: self, keyPath: \.maximumValue)
    }
    var value: PropertyBinder<Float, Void, Base> {
        PropertyBinder(root: self, keyPath: \.value)
    }
}
