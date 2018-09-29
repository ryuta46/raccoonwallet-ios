//
// Created by Taizo Kusuda on 2018/09/04.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest

class BaseTestCase: XCTestCase {

    func block(_ seconds: TimeInterval, _ handler: () -> Void) {
        let waiter = expectation(description: "Waiting for \(seconds) seconds.")

        handler()

        DispatchQueue.global().asyncAfter(deadline: .now() + seconds) {
            waiter.fulfill()
        }

        waitForExpectations(timeout: seconds * 2 )
    }
}