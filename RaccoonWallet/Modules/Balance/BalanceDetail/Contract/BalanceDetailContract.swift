//
//  BalanceDetailContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/09
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol BalanceDetailView: BaseView {
    var presenter: BalanceDetailPresentation! { get set }

    func showBalanceLoading()

    func showBalance(_ xem: Decimal)
    func showBalanceError()
    func showLocalCurrency(_ value: Decimal, _ unit: Currency)
    func showLocalCurrencyError()

    func showMosaicListLoading()
    func showMosaics(_ mosaics: [MosaicDetail])
}

//sourcery: AutoMockable
protocol BalanceDetailPresentation: BasePresentation {
    var view: BalanceDetailView? { get set }
    var interactor: BalanceDetailUseCase! { get set }
    var router: BalanceDetailWireframe! { get set }
}

//sourcery: AutoMockable
protocol BalanceDetailUseCase: class {
    var output: BalanceDetailInteractorOutput! { get set }

    func fetchMosaicOwned(_ address: String)
    func fetchRate(_ currency: Currency)
}

//sourcery: AutoMockable
protocol BalanceDetailInteractorOutput:
        NemServiceMosaicOwnedOutput,
        RateServiceInteractorOutput {
}

//sourcery: AutoMockable
protocol BalanceDetailWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}
