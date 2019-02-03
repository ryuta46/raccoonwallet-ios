//
// Created by Taizo Kusuda on 2018/09/15.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import NemSwift


extension TransferMosaic {
    var amountDescription: String {
        return MosaicDetail(namespace: namespace, mosaic: mosaic, quantity: quantity, divisibility: divisibility, description: nil).amountDescription
    }
}
