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
        if self.starts(with: "00") {
            return String(self.dropFirst(2))
        } else {
            return self
        }
    }

}

extension String {

    func encryptWithPBKDF2(salt: [UInt8]? = nil) throws -> String{
        let aSalt: [UInt8]
        if salt != nil {
            aSalt = salt!
        } else {
            aSalt = try KeyProvider.generateSalt()
        }

        return ConvertUtil.toHexString(aSalt + (try KeyProvider.deriveKey(password: self, salt: aSalt)))
    }

    func verifyWithPBKDF2(_ password: String) -> Bool{
        guard let parsed = parseAsPBKDF2() else {
            return false
        }
        guard let key = try? KeyProvider.deriveKey(password: password, salt: parsed.salt) else {
            return false
        }
        return key == parsed.encrypted
    }

    private func parseAsPBKDF2() -> (salt:[UInt8], encrypted: [UInt8])? {
        let encrypted = ConvertUtil.toByteArray(self)
        guard  encrypted.count >= KeyProvider.PBKDF2_SALT_SIZE else {
            return nil
        }
        let salt = encrypted[0..<KeyProvider.PBKDF2_SALT_SIZE].map { $0 }
        let encryptedBody = encrypted.dropFirst(KeyProvider.PBKDF2_SALT_SIZE).map { $0 }
        return (salt: salt, encrypted: encryptedBody)
    }

    func hasOnly(_ characterSet: CharacterSet) -> Bool {
        return self.trimmingCharacters(in: characterSet).count <= 0
    }

    var isNumber: Bool {
        return Double(self) != nil
    }

}
