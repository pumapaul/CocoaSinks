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

final class UILabelTests: XCTestCase {
    var label = UILabel()
    @Published var attributedText = NSAttributedString(string: "AttributedText")
    @Published var text = "Text"
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        cancellables.removeAll()
        label = UILabel()
        label.text = nil
        label.attributedText = nil
    }
}

extension UILabelTests {
    func testText() {
        label.bind.text.to($text)

        executeAndWaitOnMain {
            XCTAssertEqual(self.label.text, self.text)
        }
    }

    func testAttributedText() {
        label.bind.attributedText.to($attributedText)

        executeAndWaitOnMain {
            XCTAssertEqual(self.label.attributedText, self.attributedText)
        }
    }
}
