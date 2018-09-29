//
//  KeyProvider.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/25.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift
import CryptoSwift

class KeyProvider {
    static let PBKDF2_SALT_SIZE = 32
    static let PBKDF2_ITERATION = 2000
    static let KEY_LENGTH = 32


    static func generateSalt() throws -> [UInt8] {
        var randomSalt = [UInt8](repeating: 0, count: PBKDF2_SALT_SIZE)
        let status = SecRandomCopyBytes(kSecRandomDefault, randomSalt.count, &randomSalt)
        guard status == errSecSuccess else {
            throw NSError(domain: "Failed to create random salt", code: Int(status), userInfo: nil)
        }
        return randomSalt
    }


    static func deriveKey(password: String, salt: [UInt8]) throws -> [UInt8] {

        var derivedKey = Data(repeating: 0, count: KEY_LENGTH)
        let keyLength = derivedKey.count

        let algorithm = CCPBKDFAlgorithm(kCCPBKDF2)
        let prf = CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA1)

        let passwordLength  = password.lengthOfBytes(using: .utf8)

        let derivationStatus = derivedKey.withUnsafeMutableBytes { derivedKeyBytes in
            password.withCString { passwordBytes in
                CCKeyDerivationPBKDF(
                        algorithm,
                        passwordBytes,
                        passwordLength,
                        ConvertUtil.toNativeArray(salt),
                        salt.count,
                        prf,
                        UInt32(PBKDF2_ITERATION),
                        derivedKeyBytes, keyLength)
            }
        }

        if derivationStatus != 0 {
            throw NSError(domain: "Failed to derive key", code: Int(derivationStatus))
        }

        return [UInt8](derivedKey)
    }

}