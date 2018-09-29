//
//  QrLabInvoiceRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class QrLabInvoiceRouter: QrLabInvoiceWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(amount: Decimal,
                               localCurrencyAmount: Decimal,
                               localCurrencyUnit: String) -> UIViewController {

        let view = R.storyboard.qrLabInvoiceStoryboard.qrLabInvoiceView()!
        let presenter = QrLabInvoicePresenter()
        let interactor = QrLabInvoiceInteractor()
        let router = QrLabInvoiceRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.amount = amount
        presenter.localCurrencyAmount = localCurrencyAmount
        presenter.localCurrencyUnit = localCurrencyUnit

        interactor.output = presenter

        router.viewController = view
        return view
    }


    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func goBackHome() {
        viewController?.resetRootViewController()
        viewController?.navigationController?.popToRootViewControllerFromBottom()
    }
}

