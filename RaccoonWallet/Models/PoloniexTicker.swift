//
//  PoloniexTicker.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

struct PoloniexTicker: Codable {
    let last: Decimal

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let lastStr = try values.decode(String.self, forKey: .last)

        self.last = NumberFormatter().number(from: lastStr)!.decimalValue
    }

}

struct PoloniexTickers: Codable {
    let BTC_XEM: PoloniexTicker
}
