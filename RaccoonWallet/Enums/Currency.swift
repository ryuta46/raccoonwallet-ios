//
//  Currency.swift
//  NemPaymentApp
//
//  Created by Taizo Kusuda on 2018/03/01.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

enum Currency: String {
    case xem = "XEM"
    case jpy = "JPY"

    var precision: Int16 {
        switch self {
        case .xem: return 6
        case .jpy: return 3
        }
    }
}
