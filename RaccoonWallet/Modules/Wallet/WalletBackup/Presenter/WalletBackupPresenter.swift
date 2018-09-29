//
//  WalletBackupPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletBackupPresenter : BasePresenter {
    weak var view: WalletBackupView?
    var interactor: WalletBackupUseCase!
    var router: WalletBackupWireframe!

    var origin: WalletBackupOrigin!
    var wallet: Wallet!
    var privateKey: String = ""

    override func viewDidLoad() {
        let preference = PinPreference.shared
        if !preference.saved {
            interactor.decryptPrivateKey(wallet, pin: PinPreference.DEFAULT_PIN)
        } else {
            view?.showPinDialog(presenter: self)
        }
    }
}

extension WalletBackupPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        interactor.decryptPrivateKey(wallet, pin: pin)
    }

    func didCancelPin() {
        router.goBack(to: origin)
    }
}

extension WalletBackupPresenter: WalletBackupPresentation {
    func didClickDone() {
        router.goBack(to: origin)
    }

    func didClickPrivateKey() {
        UIPasteboard.general.string = privateKey
        view?.showInfo("Private key was copied to the clipboard.")
    }
}

extension WalletBackupPresenter : WalletBackupInteractorOutput {
    func privateKeyDecrypted(_ privateKey: String) {
        self.privateKey = privateKey
        view?.showPrivateKey(privateKey)
    }

    func privateKeyDecryptFailed() {
        view?.showError("Failed to decrypt key")
    }
}
