//
// WalletQr.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/25.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

struct WalletQr: Codable {
    let v: Int
    let type: Int
    let data: WalletQrInner
}

struct WalletQrInner: Codable {
    let name: String
    let priv_key: String
    let salt: String
}
