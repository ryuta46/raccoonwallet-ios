//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

extension Transaction {
    var isTransfer: Bool {
        return type == TransactionHelper.TransactionType.Transfer.transactionTypeBytes()
    }

    var isMultisig: Bool {
        return type == TransactionHelper.TransactionType.Multisig.transactionTypeBytes()
    }
}