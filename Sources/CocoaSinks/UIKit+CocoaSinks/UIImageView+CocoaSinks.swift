//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import UIKit

public extension Bind where Base: UIImageView {
    var image: PropertyBinder<UIImage?, UIImage, Base> {
        PropertyBinder(root: self, keyPath: \.image)
    }
    var tintColor: PropertyBinder<UIColor?, UIColor, Base> {
        PropertyBinder(root: self, keyPath: \.tintColor)
    }
}
