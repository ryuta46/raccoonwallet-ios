//
// Created by Taizo Kusuda on 2018/09/04.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift
import SwiftyMocky

@testable import RaccoonWallet

class TestSettings {
    static let address = "TCRUHA3423WEYZN64CZ62IVK53VQ5JGIRJT5UMAE"
    static let nis = URL(string: "https://nistest.ttechdev.com:7891")!

    static func setUp() {
        NemService.nis = nis
        NemSwiftConfiguration.logLevel = .debug


        Matcher.default.register(SendTransaction.self) { (lhs: SendTransaction, rhs: SendTransaction) -> Bool in
            if lhs.address != rhs.address ||
                       lhs.publicKey != rhs.publicKey ||
                       lhs.message != rhs.message ||
                       lhs.messageType != rhs.messageType ||
                       lhs.mosaics.count != rhs.mosaics.count {
                return false
            }
            for i in 0..<lhs.mosaics.count {
                if lhs.mosaics[i].amountDescription != rhs.mosaics[i].amountDescription {
                    return false
                }
            }
            return true
        }
    }
}