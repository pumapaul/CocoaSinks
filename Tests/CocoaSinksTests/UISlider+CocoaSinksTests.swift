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

final class UISliderTests: XCTestCase {
    var slider = UISlider()
    
    @Published var float: Float = 10
    
    var cancellables = Set<AnyCancellable>()
}

extension UISliderTests {
    func testMaximumValue() {
        slider.bind.maximumValue.to($float)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.slider.maximumValue, self.float, accuracy: 0.0000001)
        }
    }
    func testMinimumValue() {
        slider.bind.minimumValue.to($float)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.slider.minimumValue, self.float, accuracy: 0.0000001)
        }
    }
    func testValue() {
        slider.maximumValue = float + 10
        slider.bind.value.to($float)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.slider.value, self.float, accuracy: 0.0000001)
        }
    }
}
