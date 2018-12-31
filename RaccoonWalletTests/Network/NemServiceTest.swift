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

    func testGetHarvest() {
        NemService.nis = URL(string: "https://nismain.ttechdev.com:7891")!
        let result = try! NemService.fetchHarvest("NBZMQO7ZPBYNBDUR7F75MAKA2S3DHDCIFG775N3D").toBlocking().first()!
        print(result)
        XCTAssertNotNil(result)

    }
    func testGetMosaicDefinitions() {
        let result = try! NemService.fetchMosaicDefinitions("ename", ["ecoin0"]).toBlocking().first()!
        print(result)
        XCTAssertNotNil(result)
    }

    func testGetMosaicDefinitionsWithUndefinedMosaicName() {
        XCTAssertThrowsError(try NemService.fetchMosaicDefinitions("ename", ["ryutaaaaa"]).toBlocking().first()){ error in
            print(error)
        }
    }

    func testGetMosaicDefinitionsWithUndefinedNamespace() {
        XCTAssertThrowsError(try NemService.fetchMosaicDefinitions("enameeeeeeeeeeeeeeeeeeeee", ["ecoin0"]).toBlocking().first()){ error in
            print(error)
        }
    }

    func testGetMosaicDefinitionsMulti() {
        let result = try! NemService.fetchMosaicDefinitions("ename", ["ecoin0", "ecoin1"]).toBlocking().first()!
        print(result)
        XCTAssertNotNil(result)
    }


    func testFetchMosaicOwnedWithDefinition() {
        let result: [MosaicDetail] = try! NemService.fetchMosaicOwnedWithDefinition(TestSettings.address).toBlocking().first()!

        print(result)
        XCTAssertGreaterThan(result.count, 0)

        let mosaic = result.first { detail in detail.identifier == "ename:ecoin1" }!

        XCTAssertGreaterThan(mosaic.amount, 0)
        XCTAssertEqual(mosaic.description, "ecoin1")

        XCTAssertNotNil(result)
    }

    func testFetchTransferTransactionDetail() {
        var id: Int? = nil
        while(true) {
            let result: [TransferTransactionDetail] = try! NemService.fetchTransferTransactionDetail(TestSettings.address, withUnconfirmed: true, id: id).toBlocking().first()!
            print(result)

            if result.isEmpty {
                break
            }
            id = result.last!.id!
        }
    }
}
