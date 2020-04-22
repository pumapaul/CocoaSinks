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

final class UITextFieldTests: XCTestCase {
    var textField = UITextField()
    @Published var attributedText = NSAttributedString(string: "AttributedText")
    @Published var text = "Text"
    @Published var textOpt: String? = "Text"
    @Published var isSecureTextEntry = true
    var cancellables = Set<AnyCancellable>()

}

extension UITextFieldTests {
    func testText() {
        textField.bind.text.to($text)

        executeAndWaitOnMain {
            XCTAssertEqual(self.textField.text, self.text)
        }
    }

    func testText_cancellable() {
        textField.bind.text.cancellable($textOpt).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.textField.text, self.textOpt)
        }
    }

    func testAttributedText() {
        textField.bind.attributedText.cancellable($attributedText).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.textField.attributedText?.string, self.attributedText.string)
        }
    }

    func testIsSecureTextEntry() {
        textField.bind.isSecureTextEntry.to($isSecureTextEntry)

        executeAndWaitOnMain {
            XCTAssertEqual(self.textField.isSecureTextEntry, self.isSecureTextEntry)
        }
    }
}
