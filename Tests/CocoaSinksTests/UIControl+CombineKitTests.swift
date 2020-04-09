//
//  File.swift
//  
//
//  Created by Paul Weber on 20.04.20.
//

import XCTest
import UIKit
import Combine
import CocoaSinks

final class UIControlTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var control = UIButton()

    @Published var isSelected = true
    @Published var isEnabled = true

    override func setUp() {
        control.isSelected = false
        control.isEnabled = false
    }
}

extension UIControlTests {
    func testIsEnabled() {
        control.bind.isEnabled.cancellable($isEnabled).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.control.isEnabled, self.isEnabled)
        }
    }

    func testIsSelected() {
        control.bind.isSelected.to($isSelected)

        executeAndWaitOnMain {
            XCTAssertEqual(self.control.isSelected, self.isSelected)
        }
    }
}
