//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import RxBlocking
@testable import RaccoonWallet

class XEMBookServiceTest: XCTestCase {
    override func setUp() {
        XEMBookService.baseURL = XEMBookService.defaultURL
    }
    func testNodes() {
        let mosaics: [MosaicImageUrl] = try! XEMBookService.mosaicList().toBlocking().first()!
        print(mosaics)
        
        for mosaic in mosaics {
            XCTAssertGreaterThan(mosaic.namespace.count, 0)
            XCTAssertGreaterThan(mosaic.name.count, 0)
            XCTAssertGreaterThan(mosaic.url.count, 0)
        }
        XCTAssertGreaterThan(mosaics.count, 0)
    }

    func testReturnTickerError() {
        XEMBookService.baseURL = URL(string: "https://invalidinvalidurl.com")!

        XCTAssertThrowsError(try XEMBookService.mosaicList().toBlocking().first())
    }
    
    func testActiveNodes() {
        let activeNodeList: ActiveNodeList = try! XEMBookService.activeNodeList().toBlocking().first()!
        print(activeNodeList)
        
        XCTAssertGreaterThan(activeNodeList.http.count, 0)
        XCTAssertGreaterThan(activeNodeList.https.count, 0)
    }

}
