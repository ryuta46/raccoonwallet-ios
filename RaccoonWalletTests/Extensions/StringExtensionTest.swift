//
//  StringExtensionTest.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import NemSwift
@testable import RaccoonWallet

class StringExtensionTest: XCTestCase {

    func testPrettyAddress() {
        let input = "TALICEROONSJCPHC63F52V6FY3SDMSVAEUGHMB7C"
        let output = "TALICE-ROONSJ-CPHC63-F52V6F-Y3SDMS-VAEUGH-MB7C"

        XCTAssertEqual(output, input.prettyAddress())
    }
    
    func testEncryptWithBcrypt() {
        let input = "password"
        let encrypted = try! input.encryptWithBcrypt()
        
        XCTAssertTrue(encrypted.verifyWithBcrypt(input))
        XCTAssertFalse(encrypted.verifyWithBcrypt("foobar"))

    }
    func testEncryptWithBcryptTime() {
        let input = "password"
        let encrypted = try! input.encryptWithBcrypt()
        let iteration = 5
        
        let start = Date()
        for i in 0..<iteration {
            XCTAssertFalse(encrypted.verifyWithBcrypt(String(i)))
        }
        let elapsed = Date().timeIntervalSince(start)
        print("Average: \(elapsed / Double(iteration))")
    }
}
