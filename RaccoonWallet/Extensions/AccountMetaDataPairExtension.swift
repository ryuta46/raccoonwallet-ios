//
// Created by Taizo Kusuda on 2018/08/28.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import NemSwift

extension AccountMetaDataPair {
    var isMultisig: Bool {
        return (account.multisigInfo?.minCosignatories ?? 0) > 0
    }
}