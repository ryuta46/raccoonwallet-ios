//
//  RateS?erviceTest.swift
//  RaccoonWalletTests
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
import NemSwift
@testable import RaccoonWallet

class NemServiceTest: XCTestCase {
    override func setUp() {
        TestSettings.setUp()
    }

    func testGetMosaicDefinitions() {
        let result = try! NemService.fetchMosaicDefinitions("ttech", ["ryuta"]).toBlocking().first()!
        print(result)
        XCTAssertNotNil(result)
    }

    func testGetMosaicDefinitionsNone() {
        let result = try! NemService.fetchMosaicDefinitions("ttech", ["ryutaaaaa"]).toBlocking().first()!
        XCTAssertNil(result)
    }

    func testGetMosaicDefinitionsMulti() {
        let result = try! NemService.fetchMosaicDefinitions("ttech", ["ryuta", "ryuta1k"]).toBlocking().first()!
        print(result)
        XCTAssertNotNil(result)
    }


    func testFetchMosaicOwnedWithDefinition() {
        let result: [MosaicDetail] = try! NemService.fetchMosaicOwnedWithDefinition(TestSettings.address).toBlocking().first()!

        print(result)
        XCTAssertGreaterThan(result.count, 0)

        let mosaic = result.first { detail in detail.identifier == "ttech:ryuta" }!

        XCTAssertGreaterThan(mosaic.amount, 0)
        XCTAssertEqual(mosaic.description, "Test mosaic for NEM API")

        XCTAssertNotNil(result)
    }

    func testFetchTransferTransactionDetail() {
        let result = try! NemService.fetchTransferTransactionDetail(TestSettings.address, withUnconfirmed: true).toBlocking().first()!
        print(result)
        XCTAssertNotNil(result)
    }
}
