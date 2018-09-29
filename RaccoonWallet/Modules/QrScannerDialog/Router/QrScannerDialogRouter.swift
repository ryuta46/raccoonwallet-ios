//
//  QrScannerDialogRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class QrScannerDialogRouter: QrScannerDialogWireframe {
    weak var viewController: UIViewController?

    static func assembleModule(
            onAddress: ((String) -> Void)? = nil,
            onInvoice: ((InvoiceQr) -> Void)? = nil,
            onWallet: ((WalletQr) -> Void)? = nil,
            onError: ((String) -> Void)? = nil
    ) -> UIViewController {
        let view = R.storyboard.qrScannerDialogStoryboard.qrScannerDialogView()!
        let presenter = QrScannerDialogPresenter()
        let interactor = QrScannerDialogInteractor()
        let router = QrScannerDialogRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.onAddress = onAddress
        presenter.onInvoice = onInvoice
        presenter.onWallet = onWallet
        presenter.onError = onError
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss() {
        viewController?.dismiss(animated: true)
    }

}

