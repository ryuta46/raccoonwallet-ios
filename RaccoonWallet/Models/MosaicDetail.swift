//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

struct MosaicDetail {
    let namespace: String
    let mosaic: String
    let quantity: UInt64
    let supply: UInt64
    let divisibility: Int
    let description: String

    init(namespace: String, mosaic: String, quantity: UInt64, supply: UInt64, divisibility: Int, description: String) {
        self.namespace = namespace
        self.mosaic = mosaic
        self.quantity = quantity
        self.supply = supply
        self.divisibility = divisibility
        self.description = description
    }


    static func xem(_ quantity: UInt64) -> MosaicDetail {
        return MosaicDetail(namespace: "nem", mosaic: "xem", quantity: quantity, supply: 8_999_999_999, divisibility: 6, description: "")
    }
    func isXem() -> Bool {
        let xem = MosaicDetail.xem(0)
        return namespace == xem.namespace && mosaic == xem.mosaic
    }
    var identifier: String {
        return namespace + ":" + mosaic
    }

    var amount: Decimal {
        return Decimal.from(quantity).scale10(-divisibility)
    }

    func replaced(amount: Decimal) -> MosaicDetail {
        let quantity = (amount.scale10(divisibility) as NSDecimalNumber).uint64Value
        return replaced(quantity: quantity)
    }
    func replaced(quantity: UInt64) -> MosaicDetail {
        return MosaicDetail(namespace: namespace, mosaic: mosaic, quantity: quantity, supply: supply, divisibility: divisibility, description: description)
    }

    var amountDescription: String {
        if isXem() {
            return "\(amount) XEM"
        } else {
            return "\(amount) \(identifier)"
        }
    }

    var asTransferMosaic: TransferMosaic {
        return TransferMosaic(namespace: namespace, mosaic: mosaic, quantity: quantity, supply: supply, divisibility: divisibility)
    }

}