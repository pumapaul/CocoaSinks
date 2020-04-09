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

final class UIImageViewTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    var imageView = UIImageView()

    @Published var image = UIImage(systemName: "heart")!
    @Published var imageData = UIImage(systemName: "heart")!.pngData()!
    @Published var imageDataOpt = UIImage(systemName: "heart")!.pngData()
    @Published var nilData: Data?
    @Published var tintColor = UIColor.black

    override func setUp() {
        imageView.image = nil
        imageView.tintColor = nil
    }
}

extension UIImageViewTests {
    func testImage() {
        imageView.bind.image.to($image)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image, self.image)
        }
    }

    func testImage_Data() {
        imageView.bind.image.to(data: $imageData)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image?.pngData(), UIImage(data: self.imageData)?.pngData())
        }
    }

    func testImage_Data_optional() {
        imageView.bind.image.to(data: $imageDataOpt)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image?.pngData(), UIImage(data: self.imageData)?.pngData())
        }
    }
    
    func testImage_Data_cancellable() {
        imageView.bind.image.cancellable(data: $imageData).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image?.pngData(), UIImage(data: self.imageData)?.pngData())
        }
    }
    
    func testImage_Data_optional_cancellable() {
        imageView.bind.image.cancellable(data: $imageDataOpt).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image?.pngData(), UIImage(data: self.imageData)?.pngData())
        }
    }
    
    func testImage_Data_cancellable_nil() {
        imageView.bind.image.cancellable(data: $nilData).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image?.pngData(), nil)
        }
    }

    func testImage_Data_nil() {
        imageView.bind.image.to(data: $nilData)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.image?.pngData(), nil)
        }
    }
    
    func testTintColor() {
        imageView.bind.tintColor.cancellable($tintColor).store(in: &cancellables)

        executeAndWaitOnMain {
            XCTAssertEqual(self.imageView.tintColor, self.tintColor)
        }
    }
}
