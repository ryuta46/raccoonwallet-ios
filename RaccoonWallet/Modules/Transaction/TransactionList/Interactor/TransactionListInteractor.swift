//
//  TransactionListInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class TransactionListInteractor: NemServiceInteractor, TransactionListUseCase {
    weak var output: TransactionListInteractorOutput!

    func fetchTransferTransactionDetail(_ address: String, id: Int?) {
        fetchTransferTransactionDetail(address, output, withUnconfirmed: true, id: id)
    }
}
