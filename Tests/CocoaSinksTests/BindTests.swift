//
//  File.swift
//  
//
//  Created by Paul Weber on 21.04.20.
//

import XCTest
import UIKit
import Combine
import CocoaSinks

final class BindTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var view = UIView()
}

extension BindTests {
    func testAssociatedObject() {
        weak var ass1 = view.bind
        weak var ass2 = view.bind
        XCTAssertTrue(ass1 === ass2)
        view = UIView()
    }
}
