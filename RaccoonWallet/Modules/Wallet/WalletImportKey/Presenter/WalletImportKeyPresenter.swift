//
//  WalletImportKeyPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class WalletImportKeyPresenter: BasePresenter {
    weak var view: WalletImportKeyView?
    var interactor: WalletImportKeyUseCase!
    var router: WalletImportKeyWireframe!
    var key: String = ""
    var walletQr: WalletQr?
    var nanoWalletPassword: String?
}

extension WalletImportKeyPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        if let walletQr = self.walletQr,
           let nanoWalletPassword = self.nanoWalletPassword {
            interactor.repairWalletQr(from: walletQr, password: nanoWalletPassword, pin: pin)
        }
        else {
            interactor.repairWallet(key: key.normalizePrivateKey(), pin: pin)
        }
    }
}

extension WalletImportKeyPresenter: WalletImportKeyPresentation {
    func didInputKey(_ key: String) {
        self.key = key
        if key.count == Constant.privateKeyLength * 2 ||
                   (key.count == (Constant.privateKeyLength + 1 ) * 2 && key.starts(with: "00")){
            view?.enableOk()
        } else {
            view?.disableOk()
        }
    }

    func didClickOk() {
        guard ConvertUtil.toByteArray(key.normalizePrivateKey()).count == Constant.privateKeyLength else {
            view?.showError(R.string.localizable.wallet_invalid_key())
            return
        }
        walletQr = nil
        nanoWalletPassword = nil

        if PinPreference.shared.saved {
            view?.showPinDialog(presenter: self)
        } else {
            didValidatePin(PinPreference.DEFAULT_PIN)
        }

    }

    func didClickScan() {
        walletQr = nil
        nanoWalletPassword = nil

        view?.showScanner()
    }
    func didScanWallet(_ walletQr: WalletQr) {
        self.walletQr = walletQr
        view?.showNanoWalletPassword()
    }

    func didCatchError(_ message: String) {
        view?.showError(message)
    }

    func didInputNanoWalletPassword(_ nanoWalletPassword: String) {
        self.nanoWalletPassword = nanoWalletPassword
        if PinPreference.shared.saved {
            view?.showPinDialog(presenter: self)
        } else {
            didValidatePin(PinPreference.DEFAULT_PIN)
        }
    }

    func didClickPrivacyPolicy() {
        router.presentPrivacyPolicy()
    }
}

extension WalletImportKeyPresenter : WalletImportKeyInteractorOutput {
    func walletRepaired(wallet: Wallet) {
        router.presentWalletImportName()
    }

    func walletRepairFailed() {
        view?.showError(R.string.localizable.wallet_invalid_key())
    }

    func walletQrRepaired(wallet: Wallet) {
        router.presentWalletImportEnd()
    }

    func walletQrRepairFailed() {
        view?.showError(R.string.localizable.common_invalid_password())
    }
}
