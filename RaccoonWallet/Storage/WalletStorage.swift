//
//  WalletStorage.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/17.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RealmSwift

class WalletStorage {
    
    static let shared = WalletStorage()
    private let realm: Realm
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }

    func add(_ wallet: Wallet) {
        try! realm.write {
            realm.add(wallet)
        }
    }

    var all: [Wallet] {
        return realm.objects(Wallet.self).map { $0.duplicate() }
    }

    var count: Int {
        return realm.objects(Wallet.self).count
    }

    func update(_ wallet: Wallet) {
        guard get(by: wallet.id) != nil else {
            return
        }
        try! realm.write {
            realm.add(wallet.duplicate(), update: true)
        }
    }

    func update(_ wallets: [Wallet]) {
        try! realm.write {
            wallets.forEach { wallet in
                if get(by: wallet.id) != nil {
                    realm.add(wallet, update: true)
                }
            }
        }
    }

    func get(by id: String) -> Wallet? {
        return realm.object(ofType: Wallet.self, forPrimaryKey: id)?.duplicate()
    }

    func remove(by id: String) {
        guard let wallet = realm.object(ofType: Wallet.self, forPrimaryKey: id) else {
            return
        }
        try! realm.write {
            realm.delete(wallet)
        }
    }
}
