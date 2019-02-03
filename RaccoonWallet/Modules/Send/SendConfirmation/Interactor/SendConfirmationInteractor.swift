//
//  SendConfirmationInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class SendConfirmationInteractor: NemServiceInteractor, SendConfirmationUseCase {
    weak var output: SendConfirmationInteractorOutput!
    
    func fetchMosaicSupply(_ mosaicIds: [MosaicId]) {
        fetchMosaicSupplyList(mosaicIds, output)
    }

    func sendTransaction(_ request: [UInt8], _ keyPair: KeyPair) {
        sendTransaction(request, keyPair, output)
    }
}
