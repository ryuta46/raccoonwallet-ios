//
//  WalletNewCompletedPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletNewCompletedPresenter: BasePresenter {
    weak var view: WalletNewCompletedView?
    var interactor: WalletNewCompletedUseCase!
    var router: WalletNewCompletedWireframe!
    var name: String!

    override func viewDidLoad() {
        if PinPreference.shared.saved {
            view?.showPinDialog(presenter: self)
        } else {
            interactor.createWallet(name: name, pin: PinPreference.DEFAULT_PIN)
        }
    }
}

extension WalletNewCompletedPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        interactor.createWallet(name: name, pin: pin)
    }

    func didCancelPin() {
        router.goBack()
    }
}

extension WalletNewCompletedPresenter: WalletNewCompletedPresentation {
    func didClickOk() {
        router.presentWalletNewEnd()
    }

}

extension WalletNewCompletedPresenter: WalletNewCompletedInteractorOutput {
    func walletCreated(wallet: Wallet) {
        view?.showAddress(address: wallet.address)
    }

    func walletCreateFailed() {
        view?.showError("Failed to create wallet")
    }

}
