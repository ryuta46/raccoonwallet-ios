//
//  QrLabAmountContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol QrLabAmountView: BaseView {
    var presenter: QrLabAmountPresentation! { get set }

    func showValues(target: String, converted: String)
    func showCurrencyUnits(target: String, converted: String)

}

protocol QrLabAmountPresentation: BasePresentation {
    var view: QrLabAmountView? { get set }
    var interactor: QrLabAmountUseCase! { get set }
    var router: QrLabAmountWireframe! { get set }
    
    func didChangeFormula(_ formula: String)
    func didCalculateFormula(_ value: Decimal)
    func didConfirm()
    func didClickSwitchUnit()
}

protocol QrLabAmountUseCase: class {
    var output: QrLabAmountInteractorOutput! { get set }

    func fetchRate(_ currency: Currency)
}

protocol QrLabAmountInteractorOutput: RateServiceInteractorOutput {
}

protocol QrLabAmountWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentQrLabInvoice(
            amount: Decimal,
            localCurrencyAmount: Decimal,
            localCurrencyUnit: String)

}
