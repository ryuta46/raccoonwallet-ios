//
//  BlockchainInfoTicker.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

struct BlockchainInfoTicker: Codable {
    let last: Decimal
}

struct BlockchainInfoTickers: Codable {
    let JPY: BlockchainInfoTicker
}
