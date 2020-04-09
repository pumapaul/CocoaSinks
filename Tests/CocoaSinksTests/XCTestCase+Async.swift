//
//  File.swift
//  
//
//  Created by Paul Weber on 09.04.20.
//

import XCTest

extension XCTestCase {
    func executeAndWaitOnMain(_ block: @escaping () -> Void) {
        let asyncExpectation = expectation(description: "Async block executed")
        DispatchQueue.main.async {
            block()
            asyncExpectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
