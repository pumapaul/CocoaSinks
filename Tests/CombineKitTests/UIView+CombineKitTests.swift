//
//  File.swift
//  
//
//  Created by Paul Weber on 09.04.20.
//

import XCTest
import UIKit
import Combine
import CombineKit

final class UIViewTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var view = UIView()
    
    @Published var isHiddenPublished = false
    @Published var isUserInteractionEnabledPublished = false
    @Published var alphaDouble: Double = 0.4
    @Published var alphaFloat: Float = 0.4
    @Published var alphaCGFloat: CGFloat = 0.4
    @Published var backgroundColorPublishedOpt: UIColor? = .black
    @Published var backgroundColorPublished: UIColor = .black
    
    override func setUp() {
        cancellables.removeAll()
        view = UIView(frame: .zero)
        view.alpha = 0.5
        view.backgroundColor = .clear
    }
}

// MARK: alpha
extension UIViewTests {
    func testAlpha_AnyPublisher_Double() {
        let subject = Just<Double>(0.6)
        
        view.bind.alpha(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.6, accuracy: 0.0000001)
        }
    }
    
    func testAlpha_Published_Double() {
        view.bind.alpha($alphaDouble, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }
    
    func testAlpha_AnyPublisher_Float() {
        let subject = Just<Float>(0.6)
        
        view.bind.alpha(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.6, accuracy: 0.0000001)
        }
    }
    
    func testAlpha_Published_Float() {
        view.bind.alpha($alphaFloat, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }
    
    func testAlpha_AnyPublisher_CGFloat() {
        let subject = Just<CGFloat>(0.6)

        view.bind.alpha(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.6, accuracy: 0.0000001)
        }
    }
    
    func testAlpha_Published_CGFloat() {
        view.bind.alpha($alphaCGFloat, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.alpha, 0.4, accuracy: 0.0000001)
        }
    }
}

// MARK: backgroundColor
extension UIViewTests {
    func testBackgroundColor_AnyPublisher_optional() {
        let subject = Just<UIColor?>(nil)
        
        view.bind.backgroundColor(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.backgroundColor, nil)
        }
    }
    
    func testBackgroundColor_AnyPublisher_notOptional() {
        let subject = Just(UIColor.red)
        
        view.bind.backgroundColor(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.backgroundColor, UIColor.red)
        }
    }
    
    func testBackgroundColor_Published_notOptional() {
        view.bind.backgroundColor($backgroundColorPublished, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.backgroundColor, UIColor.black)
        }
    }
    
    func testBackgroundColor_Published_optional() {
        view.bind.backgroundColor($backgroundColorPublishedOpt, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.backgroundColor, UIColor.black)
        }
    }
}


// MARK: isHidden
extension UIViewTests {
    func testHidden_AnyPublisher_true() {
        view.isHidden = false
        let subject = Just(true)
        
        view.bind.isHidden(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isHidden, true)
        }
    }
    
    func testHidden_AnyPublisher_false() {
        view.isHidden = true
        let subject = Just(false)
        
        view.bind.isHidden(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isHidden, false)
        }
    }
    
    func testHidden_Published() {
        isHiddenPublished = true
        view.isHidden = false
        
        view.bind.isHidden($isHiddenPublished, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isHidden, true)
        }
    }
}

// MARK: isUserInteractionEnabled
extension UIViewTests {
    func testUserInteraction_AnyPublisher_true() {
        view.isUserInteractionEnabled = false
        let subject = Just(true)
        
        view.bind.isUserInteractionEnabled(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isUserInteractionEnabled, true)
        }
    }
    
    func testUserInteraction_AnyPublisher_false() {
        view.isUserInteractionEnabled = true
        let subject = Just(false)
        
        view.bind.isUserInteractionEnabled(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isUserInteractionEnabled, false)
        }
    }
    
    func testUserInteraction_Published() {
        isUserInteractionEnabledPublished = true
        view.isUserInteractionEnabled = false
        
        view.bind.isUserInteractionEnabled($isUserInteractionEnabledPublished, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.view.isUserInteractionEnabled, true)
        }
    }
}

