//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import UIKit

public extension Bind where Base: UILabel {
    var attributedText: PropertyBinder<NSAttributedString?, NSAttributedString, Base> {
        PropertyBinder(root: self, keyPath: \.attributedText)
    }
    var text: PropertyBinder<String?, String, Base> {
        PropertyBinder(root: self, keyPath: \.text)
    }
}
