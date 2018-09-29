//
//  TransactionDetailInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class TransactionDetailInteractor: NemServiceInteractor, TransactionDetailUseCase {
    weak var output: TransactionDetailInteractorOutput!

    func fetchPublicKey(_ address: String) {
        fetchPublicKey(address, output)
    }
}
