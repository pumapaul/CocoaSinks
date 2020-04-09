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

final class UILabelTests: XCTestCase {
    var label = UILabel()
    @Published var attributedTextPub = NSAttributedString(string: "Yeah, yeah, yeah")
    @Published var attributedTextPubOpt: NSAttributedString?
    @Published var textPub = "Yeah, yeah, yeah"
    @Published var textPubOpt: String?
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        cancellables.removeAll()
        label = UILabel()
        label.text = "No, no, no"
        label.attributedText = NSAttributedString(string: "No, no, no")
    }
}

// MARK: attributedText
extension UILabelTests {
    func testAttributedText_AnyPublisher_nil() {
        let subject = Just<NSAttributedString?>(nil)
        
        label.bind.attributedText(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.attributedText, nil)
        }
    }
    
    func testAttributedText_AnyPublisher() {
        let subject = Just(NSAttributedString(string: "Yeah, yeah, yeah"))
        
        label.bind.attributedText(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.attributedText, NSAttributedString(string: "Yeah, yeah, yeah"))
        }
    }
    
    func testAttributedText_Published_nil() {
        label.bind.attributedText($attributedTextPubOpt, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.attributedText, nil)
        }
    }
    
    func testAttributedText_Published() {
        label.bind.attributedText($attributedTextPub, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.attributedText, NSAttributedString(string: "Yeah, yeah, yeah"))
        }
    }
}

// MARK: text
extension UILabelTests {
    func testText_AnyPublisher_nil() {
        let subject = Just<String?>(nil)
        
        label.bind.text(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.text, nil)
        }
    }
    
    func testText_AnyPublisher() {
        let subject = Just("Yeah, yeah, yeah")
        
        label.bind.text(subject.eraseToAnyPublisher(), store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.text, "Yeah, yeah, yeah")
        }
    }
    
    func testText_Published_nil() {
        label.bind.text($textPubOpt, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.text, nil)
        }
    }
    
    func testText_Published() {
        label.bind.text($textPub, store: &cancellables)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.label.text, "Yeah, yeah, yeah")
        }
    }
}
