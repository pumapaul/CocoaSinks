//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import UIKit
import Combine

public extension Bind where Base: UIActivityIndicatorView {
    var isAnimating: MethodBinder<Bool, Void, Base> {
        MethodBinder(root: self) { (newAnimating, activityIndicator) in
            if newAnimating {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }
}
