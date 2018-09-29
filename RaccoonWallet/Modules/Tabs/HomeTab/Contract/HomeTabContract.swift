//
//  HomeTabContract.swift
//  NemPaymentApp
//
//  Created by Taizo Kusuda on 2018/03/01.
//  Copyright © 2018年 ryuta46. All rights reserved.
//

import UIKit
import NemSwift

protocol HomeTabView: BaseView {
    var presenter: HomeTabPresentation! { get set }

    func showLoading()
    func hideLoading()
    
    func showBalance(_ xem: Decimal)
    func showBalanceError()
    func showLocalCurrency(_ value: Decimal, _ unit: Currency)
    func showLocalCurrencyError()

    func showTransaction(_ transactions: [TransferTransactionDetail])
    func showTransactionEmpty()
    func showTransactionError()

    func showHarvest(_ harvests: [Harvest])
    func showHarvestEmpty()
    func showHarvestError()
}

protocol HomeTabPresentation: BasePresentation {
    var view: HomeTabView? { get set }
    var interactor: HomeTabUseCase! { get set }

    var address: String! { get set }

    func didRefresh()
    func didClickBalance()
    func didClickTransaction()
    func didClickHarvest()
}

protocol HomeTabUseCase: class {
    var output: HomeTabInteractorOutput! { get set }

    func fetchBalance(_ address: String)
    func fetchTransferTransactionDetail(_ address: String)
    func fetchHarvest(_ address: String)
    func fetchRate(_ currency: Currency)
}

protocol HomeTabInteractorOutput:
        NemServiceBalanceOutput,
        NemServiceTransferTransactionDetailOutput,
        NemServiceHarvestOutput,
        RateServiceInteractorOutput {
}

protocol HomeTabWireframe: class {
    func presentBalance()
    func presentTransaction()
    func presentHarvest()
}
