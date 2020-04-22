//
//  File.swift
//  
//
//  Created by Paul Weber on 22.04.20.
//

import XCTest
import UIKit
import Combine
import CocoaSinks

final class UISwitchTests: XCTestCase {
    var view = UISwitch()

    @Published var isOn = true

    var cancellables = Set<AnyCancellable>()
}

extension UISwitchTests {
    func testIsOn() {
        view.isOn = false
        view.bind.isOn.to($isOn)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isOn, self.isOn)
        }
    }
}
