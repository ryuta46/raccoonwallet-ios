//
//  HomeTabInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

class HomeTabInteractor: NemServiceInteractor, RateServiceUseCase, HomeTabUseCase {
    weak var output: HomeTabInteractorOutput!

    func fetchBalance(_ address: String) {
        fetchBalance(address, output)
    }

    func fetchRate(_ currency: Currency) {
        fetchRate(currency, output)
    }

    func fetchTransferTransactionDetail(_ address: String) {
        fetchTransferTransactionDetail(address, output, withUnconfirmed: false)
    }

    func fetchHarvest(_ address: String) {
        fetchHarvest(address, output)
    }
}
