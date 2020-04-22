//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import UIKit

public extension Bind where Base: UISwitch {
    var isOn: PropertyBinder<Bool, Void, Base> {
        PropertyBinder(root: self, keyPath: \.isOn)
    }
}
