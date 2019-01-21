//
//  BalanceDetailInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/09
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class BalanceDetailInteractor: NemServiceInteractor, RateServiceUseCase, BalanceDetailUseCase {
    weak var output: BalanceDetailInteractorOutput!

    func fetchMosaicOwned(_ address: String) {
        fetchMosaicOwned(address, output)
    }

    func fetchRate(_ currency: Currency) {
        fetchRate(currency, output)
    }
}
