//
// SendTransaction.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/09/03.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

struct SendTransaction {
    let address: String
    var publicKey: String?
    let namespace: String
    var mosaics: [MosaicDetail] = []
    var message: String?
    var messageType: TransferTransactionHelper.MessageType = .plain


    init(address: String, publicKey: String?, namespace: String = "") {
        self.address = address
        self.publicKey = publicKey
        self.namespace = namespace
    }
    
    var isOnlyXem: Bool {
        return mosaics.count == 1 && mosaics[0].isXem()
    }
}
