//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import UIKit
import Combine

public extension Bind where Base: UIButton {
    var attributedTitle: MethodBinderTwoParameters<NSAttributedString?, NSAttributedString, UIButton.State, Base> {
        MethodBinderTwoParameters(root: self) { (attrStr, state, button) in
            button.setAttributedTitle(attrStr, for: state)
        }
    }
    var title: MethodBinderTwoParameters<String?, String, UIButton.State, Base> {
        MethodBinderTwoParameters(root: self) { (str, state, button) in
            button.setTitle(str, for: state)
        }
    }
    var backgroundImage: MethodBinderTwoParameters<UIImage?, UIImage, UIButton.State, Base> {
        MethodBinderTwoParameters(root: self) { (image, state, button) in
            button.setBackgroundImage(image, for: state)
        }
    }
    var image: MethodBinderTwoParameters<UIImage?, UIImage, UIButton.State, Base> {
        MethodBinderTwoParameters(root: self) { (image, state, button) in
            button.setImage(image, for: state)
        }
    }
}
