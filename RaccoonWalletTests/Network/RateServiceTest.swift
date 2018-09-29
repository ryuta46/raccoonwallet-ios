//
//  RateServiceTest.swift
//  RaccoonWalletTests
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking

@testable import RaccoonWallet

class RateServiceTest: XCTestCase {
    override func setUp() {
        BlockchainInfoService.baseURL = BlockchainInfoService.defaultURL
        PoloniexService.baseURL = PoloniexService.defaultURL
    }

    func testGetRate() {
        let rate = try! RateService.getRate(currency: .jpy).toBlocking().first()!
        print(rate)
        XCTAssertGreaterThan(rate, 0)
        XCTAssertLessThan(rate, 1_000_000)
    }

    func testGetRateErrorPoloniex() {
        PoloniexService.baseURL = URL(string: "https://invalidinvalidurl.com")!
        XCTAssertThrowsError(try RateService.getRate(currency: .jpy).toBlocking().first())
    }

    func testGetRateErrorBlockchainInfo() {
        BlockchainInfoService.baseURL = URL(string: "https://invalidinvalidurl.com")!
        XCTAssertThrowsError(try RateService.getRate(currency: .jpy).toBlocking().first())
    }
}
