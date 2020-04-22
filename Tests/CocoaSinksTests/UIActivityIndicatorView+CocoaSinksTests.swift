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

final class UIActivityIndicatorViewTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var indicatorView = UIActivityIndicatorView(style: .medium)
    
    @Published var isAnimating = true
}

extension UIActivityIndicatorViewTests {
    func testIsAnimating() {
        indicatorView.stopAnimating()
        indicatorView.bind.isAnimating.to($isAnimating)
        isAnimating = true
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.indicatorView.isAnimating, self.isAnimating)
        }
    }
    
    func testIsAnimating_false() {
        indicatorView.startAnimating()
        indicatorView.bind.isAnimating.to($isAnimating)
        isAnimating = false
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.indicatorView.isAnimating, self.isAnimating)
        }
    }
}
