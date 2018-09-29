//
//  QrLabInvoiceContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol QrLabInvoiceView: BaseView {
    var presenter: QrLabInvoicePresentation! { get set }

    func showAmount(_ amount: String)
    func showLocalCurrency(_ amount: String, _ unit: String)
    func showQr(_ invoiceQrJson: String)
    func showAddress(_ address: String)
}

protocol QrLabInvoicePresentation: BasePresentation {
    var view: QrLabInvoiceView? { get set }
    var interactor: QrLabInvoiceUseCase! { get set }
    var router: QrLabInvoiceWireframe! { get set }

    func didClickOk()
}

protocol QrLabInvoiceUseCase: class {
    var output: QrLabInvoiceInteractorOutput! { get set }
}

protocol QrLabInvoiceInteractorOutput: class {
}

protocol QrLabInvoiceWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(amount: Decimal,
                               localCurrencyAmount: Decimal,
                               localCurrencyUnit: String) -> UIViewController

    func goBackHome()
}
