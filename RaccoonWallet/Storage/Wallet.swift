//
//  Wallet.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/17.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
class Wallet: Object {
    @objc dynamic var id: String = NSUUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var publicKey: String = ""
    @objc dynamic var salt: String = ""
    @objc dynamic var encryptedSecretKey: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var isMultisig: Bool = false

    override static func primaryKey() -> String? {
        return "id"
    }

    func duplicate() -> Wallet {
        // Memberwise copy
        let wallet = Wallet()
        wallet.id = id
        wallet.name = name
        wallet.publicKey = publicKey
        wallet.salt = salt
        wallet.encryptedSecretKey = encryptedSecretKey
        wallet.address = address
        wallet.isMultisig = isMultisig

        return wallet
    }
}
