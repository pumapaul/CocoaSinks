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

final class UIButtonTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var button = UIButton()

    @Published var titlePub = "Title"
    @Published var attributedTitlePubOpt: NSAttributedString? = NSAttributedString(string: "AttributedTitle")
    @Published var image = UIImage(systemName: "heart")!
    @Published var imageData = UIImage(systemName: "heart")!.pngData()!
    @Published var imageDataOpt = UIImage(systemName: "heart")!.pngData()
    @Published var nilData: Data?

    override func setUp() {
        button.setTitle(nil, for: .normal)
        button.setImage(nil, for: .normal)
        button.setBackgroundImage(nil, for: .normal)
        button.setAttributedTitle(nil, for: .normal)
    }
}

extension UIButtonTests {
    func testTitle() {
        button.bind.title.to($titlePub)

        executeAndWaitOnMain {
            XCTAssertEqual(self.button.title(for: .normal), self.titlePub)
        }
    }

    func testAttributedTitle_optional() {
        button.bind.attributedTitle.to($attributedTitlePubOpt)

        executeAndWaitOnMain {
            XCTAssertEqual(self.button.attributedTitle(for: .normal), self.attributedTitlePubOpt)
        }
    }

    func testImage() {
        button.bind.image.to($image)

        executeAndWaitOnMain {
            XCTAssertEqual(self.button.image(for: .normal), self.image)
        }
    }

    func testBackgroundImage() {
        button.bind.backgroundImage.to($image)

        executeAndWaitOnMain {
            XCTAssertEqual(self.button.backgroundImage(for: .normal), self.image)
        }
    }

    func testImage_Data() {
        button.bind.image.to(data: $imageData)

        executeAndWaitOnMain {
            XCTAssertEqual(self.button.image(for: .normal)?.pngData(), UIImage(data: self.imageData)?.pngData())
        }
    }

    func testImage_Data_optional() {
        button.bind.image.to(data: $imageDataOpt)

        executeAndWaitOnMain {
            XCTAssertEqual(self.button.image(for: .normal)?.pngData(), UIImage(data: self.imageData)?.pngData())
        }
    }

    func testImage_Data_nil() {
        button.bind.image.to(data: $nilData)
        
        executeAndWaitOnMain {
            XCTAssertEqual(self.button.image(for: .normal)?.pngData(), nil)
        }
    }
}
