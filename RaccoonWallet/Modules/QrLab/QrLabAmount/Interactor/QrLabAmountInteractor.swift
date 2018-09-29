//
//  QrLabAmountInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

class QrLabAmountInteractor: RateServiceInteractor, QrLabAmountUseCase {
    weak var output: QrLabAmountInteractorOutput!

    func fetchRate(_ currency: Currency) {
        fetchRate(currency, output)
    }

}
