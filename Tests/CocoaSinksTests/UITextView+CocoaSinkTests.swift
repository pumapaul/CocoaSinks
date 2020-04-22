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

final class UITextViewTests: XCTestCase {
    var textView = UITextView()
    @Published var attributedText = NSAttributedString(string: "AttributedText")
    @Published var text = "Text"
    var cancellables = Set<AnyCancellable>()

}

extension UITextViewTests {
    func testText() {
        textView.bind.text.to($text)

        executeAndWaitOnMain {
            XCTAssertEqual(self.textView.text, self.text)
        }
    }

    func testAttributedText() {
        textView.bind.attributedText.cancellable($attributedText).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.textView.attributedText.string, self.attributedText.string)
        }
    }
}
