//
//  BlockchainInfoServiceTest.swift
//  RaccoonWalletTests
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
@testable import RaccoonWallet

class BlockchainInfoServiceTest: XCTestCase {
    override func setUp() {
        BlockchainInfoService.baseURL = BlockchainInfoService.defaultURL
    }

    func testTicker() {
        let tickers = try! BlockchainInfoService.ticker().toBlocking().first()!
        let last = tickers.JPY.last
        print(last)
        XCTAssertGreaterThan(last, 0)
        XCTAssertLessThan(last, 100_000_000)
    }

    func testReturnTickerError() {
        BlockchainInfoService.baseURL = URL(string: "https://invalidinvalidurl.com")!
        XCTAssertThrowsError(try BlockchainInfoService.ticker().toBlocking().first())
    }

}
