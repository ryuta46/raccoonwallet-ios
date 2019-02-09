//
//  SendAmountInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/03
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

class SendAmountInteractor: NemServiceInteractor, RateServiceUseCase, SendAmountUseCase {
    weak var output: SendAmountInteractorOutput!

    func fetchMosaicOwned(_ address: String) {
        fetchMosaicOwned(address, output)
    }

    func fetchRate(_ currency: Currency) {
        fetchRate(currency, output)
    }
}
