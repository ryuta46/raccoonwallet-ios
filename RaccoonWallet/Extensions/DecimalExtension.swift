//
//  DecimalExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

extension Decimal {
    static func from(_ value: UInt64) -> Decimal {
        return Decimal(value).round()
    }

    func floor(_ position: Int16 = 0) -> Decimal {
        return round(position, .down)
    }

    func ceil(_ position: Int16 = 0) -> Decimal {
        return round(position, .up)
    }

    func round(_ position: Int16 = 0, _ roundingMode: RoundingMode = .plain) -> Decimal {
        let behavior = NSDecimalNumberHandler(roundingMode: roundingMode, scale: position, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        return (self as NSDecimalNumber).rounding(accordingToBehavior: behavior) as Decimal
    }

    func scale10(_ scale: Int) -> Decimal {
        if scale > 0 {
            return self * pow(Decimal(10), scale)
        } else {
            return self / pow(Decimal(10), -scale)
        }
    }
}
