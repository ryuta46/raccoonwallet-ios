//
//  WalletHelper.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift
import CryptoSwift

class WalletHelper {
    static let SALT_SIZE = 32
    static let SALT_ITERATION = 4096
    static func createWallet(name: String, password: String, importKey: String? = nil) throws -> Wallet {
        let account: Account
        if let key = importKey {
            account = Account.repairAccount(key, network: NemConfiguration.addressNetwork)
        } else {
            account = Account.generateAccount(network: NemConfiguration.addressNetwork)
        }

        let wallet = Wallet()

        let encrypted = try encryptKey(account.keyPair.importKey(), password: password)
        wallet.name = name
        wallet.address = account.address.value
        wallet.publicKey = account.keyPair.publicKeyHexString()
        wallet.salt = encrypted.salt
        wallet.encryptedSecretKey = encrypted.encryptedKey

        return wallet
    }

    static func repairAccount(from wallet: Wallet, password: String) throws -> Account {
        let decryptedSecret = try decryptKey(wallet.encryptedSecretKey, salt: wallet.salt, password: password)
        // check the key is valid
        let account = Account.repairAccount(decryptedSecret, network: NemConfiguration.addressNetwork)
        
        guard account.address.value == wallet.address else {
            throw NSError(domain: "Repaired account is not valid. Password may be wrong.", code: 0, userInfo: nil)
        }
        return account
    }

    static func reencryptWallet(_ wallet: Wallet, oldPassword: String, newPassword: String) throws {
        let decryptedKey = try decryptKey(wallet.encryptedSecretKey, salt: wallet.salt, password: oldPassword)
        let reencrypted = try encryptKey(decryptedKey, password: newPassword)
        wallet.salt = reencrypted.salt
        wallet.encryptedSecretKey = reencrypted.encryptedKey
    }

    static func encryptKey(_ importKey: String, password: String) throws -> (salt: String, encryptedKey: String){
        let salt = try KeyProvider.generateSalt()
        let key = try KeyProvider.deriveKey(password: password, salt: salt)
        let iv = AES.randomIV(AES.blockSize)

        let aes = try AES(key: key, blockMode: CBC(iv: iv))
        let encrypted = try aes.encrypt(ConvertUtil.toByteArray(importKey))
        
        return (salt: ConvertUtil.toHexString(salt), encryptedKey: ConvertUtil.toHexString(iv + encrypted))
    }
    
    static func decryptKey(_ encryptedKey: String, salt: String, password: String) throws -> String {
        let encryptedKeyBytes = ConvertUtil.toByteArray(encryptedKey)
        if encryptedKeyBytes.count <= AES.blockSize {
            throw NSError(domain: "Encrypted key size is invalid.", code: 0, userInfo: nil)
        }
        let salt = ConvertUtil.toByteArray(salt)
        let iv = encryptedKeyBytes[0..<AES.blockSize].map { $0 }
        let encryptedBody = encryptedKeyBytes.dropFirst(AES.blockSize).map { $0 }

        let key = try KeyProvider.deriveKey(password: password, salt: salt)
        let aes = try AES(key: key, blockMode: CBC(iv: iv))
        let decrypted = try aes.decrypt(encryptedBody)
        
        return ConvertUtil.toHexString(decrypted)
    }

    static var activeWallet: Wallet? {
        guard let activeWalletId = ApplicationSetting.shared.activeWalletId else {
            return nil
        }
        return WalletStorage.shared.get(by: activeWalletId)
    }
    
}
