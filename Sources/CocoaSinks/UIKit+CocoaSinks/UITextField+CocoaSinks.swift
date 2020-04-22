//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import UIKit

public extension Bind where Base: UITextField {
    var attributedText: MethodBinder<NSAttributedString?, NSAttributedString, Base> {
        MethodBinder(root: self) { (newText, textField) in
            guard newText != textField.attributedText else { return }
            textField.attributedText = newText
        }
    }
    var isSecureTextEntry: PropertyBinder<Bool, Void, Base> {
        PropertyBinder(root: self, keyPath: \.isSecureTextEntry)
    }
    var text: MethodBinder<String?, String, Base> {
        MethodBinder(root: self) { (newText, textField) in
            guard newText != textField.text else { return }
            textField.text = newText
        }
    }
}
