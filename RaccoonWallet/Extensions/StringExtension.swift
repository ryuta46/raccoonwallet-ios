//
//  StringExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import CryptoSwift
import NemSwift
import BCryptSwift


extension String {
    func prettyAddress() -> String {
        let matcher = try! NSRegularExpression(pattern: ".{1,6}")
        return matcher.matches(in: self, range: NSRange(location: 0, length: count)).map {
            (self as NSString).substring(with: $0.range)
        }.joined(separator: "-")
    }

    func plainAddress() -> String {
        return replacingOccurrences(of: "-", with: "")
    }

    func normalizePrivateKey() -> String {
        if self.count == (Constant.privateKeyLength + 1) * 2 && self.starts(with: "00") {
            return String(self.dropFirst(2))
        } else {
            return self
        }
    }

}

extension String {
    func encryptWithBcrypt() throws -> String {
        let salt = BCryptSwift.generateSaltWithNumberOfRounds(10)
        guard let hash = BCryptSwift.hashPassword(self, withSalt: salt) else {
            throw NSError(domain: "Failed to hash pin code", code: 0)
        }
        return hash
    }

    func verifyWithBcrypt(_ password: String) -> Bool {
        return BCryptSwift.verifyPassword(password, matchesHash: self) ?? false
    }


    func hasOnly(_ characterSet: CharacterSet) -> Bool {
        return self.trimmingCharacters(in: characterSet).count <= 0
    }

    var isNumber: Bool {
        return Double(self) != nil
    }

}
