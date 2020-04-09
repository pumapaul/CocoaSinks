//
//  File.swift
//  
//
//  Created by Paul Weber on 09.04.20.
//

import XCTest
import UIKit
import Combine
import CocoaSinks

final class UIViewTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var view = UIView()

    @Published var isHidden = false
    @Published var alphaDouble: Double = 0.4
    @Published var alphaFloat: Float = 0.4
    @Published var backgroundColor: UIColor = .black

    override func setUp() {
        cancellables.removeAll()
        view.isHidden = true
        view.alpha = 0.5
        view.backgroundColor = .clear
    }
}

extension UIViewTests {
    func testIsHidden() {
        view.bind.isHidden.to($isHidden)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isHidden, false)
        }
    }

    func testBackgroundColor() {
        view.bind.backgroundColor.to($backgroundColor)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.backgroundColor, self.backgroundColor)
        }
    }

    func testAlpha() {
        view.bind.alpha.to($alphaFloat)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }

    func testAlphaDouble() {
        view.bind.alpha.to($alphaDouble)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }
    
    func testAlpha_cancellable() {
        view.bind.alpha.cancellable($alphaFloat).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }

    func testAlphaDouble_cancellable() {
        view.bind.alpha.cancellable($alphaDouble).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }
    func testIsUserInteractionEnabled() {
        view.bind.isUserInteractionEnabled.to(Just(false).eraseToAnyPublisher())

        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isUserInteractionEnabled, false)
        }
    }
}
