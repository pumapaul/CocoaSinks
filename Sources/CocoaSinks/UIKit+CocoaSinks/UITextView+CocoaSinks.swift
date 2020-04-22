//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import UIKit

public extension Bind where Base: UITextView {
    var attributedText: PropertyBinder<NSAttributedString?, NSAttributedString, Base> {
        PropertyBinder(root: self, keyPath: \.attributedText)
    }
    var text: PropertyBinder<String?, String, Base> {
        PropertyBinder(root: self, keyPath: \.text)
    }
}
