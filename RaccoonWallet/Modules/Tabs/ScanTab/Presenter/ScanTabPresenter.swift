//
//  ScanTabPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class ScanTabPresenter: BasePresenter {
    weak var view: ScanTabView?
    var interactor: ScanTabUseCase!
    var router: ScanTabWireframe!
    var sendTransaction: SendTransaction!

    override func viewDidAppear() {
        super.viewDidAppear()
        view?.startScan()
    }

    override func viewWillDisappear() {
        super.viewWillDisappear()
        view?.stopScan()
    }
}

extension ScanTabPresenter: ScanTabPresentation {
    func didScanAddress(_ address: String) {
        guard validatePreConditions() else {
            return
        }

        let plainAddress = address.plainAddress()
        guard plainAddress.count == Constant.addressLength else {
            view?.showError(R.string.localizable.common_invalid_address())
            return
        }
        sendTransaction = SendTransaction(address: plainAddress, publicKey: nil)

        view?.showLoading()
        view?.pause(true)

        interactor.fetchPublicKey(plainAddress)
    }

    func didScanInvoice(_ invoice: InvoiceQr) {
        guard validatePreConditions() else {
            return
        }

        let plainAddress = invoice.data.addr.plainAddress()
        guard plainAddress.count == Constant.addressLength else {
            view?.showError(R.string.localizable.common_invalid_address())
            return
        }
        sendTransaction = SendTransaction(address: plainAddress, publicKey: nil)

        if let amount = invoice.data.amount {
            if amount > 0 {
                sendTransaction.mosaics = [MosaicDetail.xem(amount)]
            }
        }
        if let message = invoice.data.msg {
            sendTransaction.message = message
            sendTransaction.messageType = .plain
        }

        view?.showLoading()
        view?.pause(true)

        interactor.fetchPublicKey(plainAddress)
    }

    func didCatchError(_ message: String) {
        view?.showError(message)
    }

    private func validatePreConditions() -> Bool {
        guard PinPreference.shared.saved else {
            view?.pause(true)
            view?.showNotSetPinError()
            return false
        }
        guard WalletHelper.activeWallet != nil else {
            view?.pause(true)
            view?.showNotSelectWalletError()
            return false
        }
        return true
    }

    func didClickGoPinSetting() {
        router.presentSetting()
    }

    func didClickGoWalletSelect() {
        router.presentWalletSelect()
    }
}

extension ScanTabPresenter: ScanTabInteractorOutput {
    func publicKeyFetched(_ publicKey: String?) {
        view?.hideLoading()
        sendTransaction.publicKey = publicKey

        if sendTransaction.mosaics.isEmpty {
            // if amount is not set, jump to amount setting
            router.presentSendAmount(sendTransaction)
        } else if sendTransaction.message?.isEmpty ?? true {
            // if message is not set, jump to message setting
            router.presentSendMode(sendTransaction)
        } else {
            // if amount and message is set, jump to confirmation
            router.presentSendConfirmation(sendTransaction)
        }
    }

    func publicKeyFetchFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(R.string.localizable.common_error_network())
        view?.pause(false)
    }
}
