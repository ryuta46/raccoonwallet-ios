//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
@testable import RaccoonWallet

class NemNodesServiceTest: XCTestCase {
    override func setUp() {
        NemNodesService.baseURL = NemNodesService.defaultURL
    }
    func testNodes() {
        let nodes = try! NemNodesService.nodes().toBlocking().first()!
        print(nodes)
        XCTAssertGreaterThan(nodes.count, 0)
    }

    func testReturnTickerError() {
        NemNodesService.baseURL = URL(string: "https://invalidinvalidurl.com")!

        XCTAssertThrowsError(try NemNodesService.nodes().toBlocking().first())
    }
}
