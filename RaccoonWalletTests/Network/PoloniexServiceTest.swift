//
//  PoloniexServiceTest.swift
//  RaccoonWalletTests
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
@testable import RaccoonWallet

class PoloniexServiceTest: XCTestCase {
    override func setUp() {
        PoloniexService.baseURL = PoloniexService.defaultURL
    }
    func testReturnTicker() {
        let poloniexTickers = try! PoloniexService.returnTicker().toBlocking().first()!
        let last = poloniexTickers.BTC_XEM.last
        print(last)
        XCTAssertGreaterThan(last, 0)
        XCTAssertLessThan(last, 1)
    }

    func testReturnTickerError() {
        PoloniexService.baseURL = URL(string: "https://invalidinvalidurl.com")!
        XCTAssertThrowsError(try PoloniexService.returnTicker().toBlocking().first())
    }
}
