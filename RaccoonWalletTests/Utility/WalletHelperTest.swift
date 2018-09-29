//
//  WalletHelperTest.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/21.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import NemSwift
@testable import RaccoonWallet

class WalletHelperTest: XCTestCase {
    
    
    func testCreateWallet() {
        let name = "wallet_name"
        let password = "133531"

        let wallet = try! WalletHelper.createWallet(name: name, password: password)

        XCTAssertEqual(name, wallet.name)
        XCTAssertFalse(wallet.id.isEmpty)
        XCTAssertFalse(wallet.address.isEmpty)
    }
    func testEncryption() {
        let name = "wallet_name"
        let password = "133531"
        
        let wallet = try! WalletHelper.createWallet(name: name, password: password)
        let repaired = try! WalletHelper.repairAccount(from: wallet, password: password)

        XCTAssertEqual(wallet.address, repaired.address.value)

    }
    
    func testDecryptionFail() {
        let name = "wallet_name"
        let password = "133531"
        
        let wallet = try! WalletHelper.createWallet(name: name, password: password)
        XCTAssertThrowsError(try WalletHelper.repairAccount(from: wallet, password: "000000"))
       
    }
}
