//
//  QrLabAmountRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class QrLabAmountRouter: QrLabAmountWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.qrLabAmountStoryboard.qrLabAmountView()!
        let presenter = QrLabAmountPresenter()
        let interactor = QrLabAmountInteractor()
        let router = QrLabAmountRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }


    func presentQrLabInvoice(amount: Decimal, localCurrencyAmount: Decimal, localCurrencyUnit: String) {
        viewController?.pushWithNavigation(QrLabInvoiceRouter.assembleModule(
                amount: amount,
                localCurrencyAmount: localCurrencyAmount,
                localCurrencyUnit: localCurrencyUnit))
    }
}

