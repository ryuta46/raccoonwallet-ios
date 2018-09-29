//
//  QrScannerDialogContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

protocol QrScannerDialogView: BaseView {
    var presenter: QrScannerDialogPresentation! { get set }

    func startCapture()
    func stopCapture()
}

protocol QrScannerDialogPresentation: BasePresentation {
    var view: QrScannerDialogView? { get set }
    var interactor: QrScannerDialogUseCase! { get set }
    var router: QrScannerDialogWireframe! { get set }

    func didClickCancel()
    func didScanAddress(_ address: String)
    func didScanInvoice(_ invoice: InvoiceQr)
    func didScanWallet(_ wallet: WalletQr)
    func didCatchError(_ message: String)
}

protocol QrScannerDialogUseCase: class {
    var output: QrScannerDialogInteractorOutput! { get set }
}

protocol QrScannerDialogInteractorOutput: class {
}

protocol QrScannerDialogWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(
            onAddress: ((String) -> Void)?,
            onInvoice: ((InvoiceQr) -> Void)?,
            onWallet: ((WalletQr) -> Void)?,
            onError: ((String) -> Void)?
    ) -> UIViewController

    func dismiss()
}
