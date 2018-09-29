//
//  QrScannerDialogPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class QrScannerDialogPresenter: BasePresenter {
    weak var view: QrScannerDialogView?
    var interactor: QrScannerDialogUseCase!
    var router: QrScannerDialogWireframe!

    var onAddress: ((String) -> Void)?
    var onInvoice: ((InvoiceQr) -> Void)?
    var onWallet: ((WalletQr) -> Void)?
    var onError: ((String) -> Void)?

    override func viewDidAppear() {
        view?.startCapture()
    }

    override func viewWillDisappear() {
        view?.stopCapture()
    }
}

extension QrScannerDialogPresenter: QrScannerDialogPresentation {
    func didClickCancel() {
        router.dismiss()
    }

    func didScanAddress(_ address: String) {
        onAddress?(address)
        router.dismiss()
    }

    func didScanInvoice(_ invoice: InvoiceQr) {
        onInvoice?(invoice)
        router.dismiss()
    }

    func didScanWallet(_ wallet: WalletQr) {
        onWallet?(wallet)
        router.dismiss()
    }

    func didCatchError(_ message: String) {
        onError?(message)
        router.dismiss()
    }
}

extension QrScannerDialogPresenter: QrScannerDialogInteractorOutput {
    
}
