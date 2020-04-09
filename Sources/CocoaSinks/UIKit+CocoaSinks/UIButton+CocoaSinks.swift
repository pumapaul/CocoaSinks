//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import UIKit
import Combine

public extension Bind where Base: UIButton {
    var attributedTitle: MethodBinder<NSAttributedString?, NSAttributedString, Base> {
        MethodBinder(root: self) { (prop, base) in
            base.setAttributedTitle(prop, for: .normal)
        }
    }
    var title: MethodBinder<String?, String, Base> {
        MethodBinder(root: self) { (prop, base) in
            base.setTitle(prop, for: .normal)
        }
    }
    var backgroundImage: MethodBinder<UIImage?, UIImage, Base> {
        MethodBinder(root: self) { (prop, base) in
            base.setBackgroundImage(prop, for: .normal)
        }
    }
    var image: MethodBinder<UIImage?, UIImage, Base> {
        MethodBinder(root: self) { (prop, base) in
            base.setImage(prop, for: .normal)
        }
    }
}
