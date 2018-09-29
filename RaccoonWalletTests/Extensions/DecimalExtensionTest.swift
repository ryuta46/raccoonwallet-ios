//
// Created by Taizo Kusuda on 2018/09/04.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
@testable import RaccoonWallet

class DecimalExtensionTest: XCTestCase {

    func testFloor() {
        let original = Decimal(string: "4.5128")!
        let calculated = original.floor(3)
        XCTAssertEqual("4.512", calculated.description)
    }
    func testCeil() {
        let original = Decimal(string: "4.5128")!
        let calculated = original.ceil(3)
        XCTAssertEqual("4.513", calculated.description)
    }
    func testRoundUp() {
        let original = Decimal(string: "4.5128")!
        let calculated = original.round(3)
        XCTAssertEqual("4.513", calculated.description)
    }
    func testRoundDown() {
        let original = Decimal(string: "4.5124")!
        let calculated = original.round(3)
        XCTAssertEqual("4.512", calculated.description)
    }

    func testScale10Plus() {
        let original = Decimal(string: "4.5124")!
        let calculated = original.scale10(2)
        XCTAssertEqual("451.24", calculated.description)
    }

    func testScale10Minus() {
        let original = Decimal(string: "4.5124")!
        let calculated = original.scale10(-2)
        XCTAssertEqual("0.045124", calculated.description)
    }

    func testScale10Minus2() {
        let original = Decimal.from(1827453)
        let calculated = original.scale10(-6)
        XCTAssertEqual("1.827453", calculated.description)
    }
}