//
//  WalletSettingPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class WalletSettingPresenter: BasePresenter {
    weak var view: WalletSettingView?
    var interactor: WalletSettingUseCase!
    var router: WalletSettingWireframe!
    var wallet: Wallet!

    override func viewDidLoad() {
        view?.showWalletName(wallet)
        view?.showLoading()
        interactor.fetchAccount(wallet.address)
    }
}
extension WalletSettingPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        router.presentDelete(wallet)
    }
}

extension WalletSettingPresenter: WalletSettingPresentation {
    func didClickDetail() {
        router.presentDetail(wallet)
    }

    func didClickAddress() {
        router.presentAddress(wallet)
    }

    func didClickBackup() {
        router.presentBackup(wallet)
    }

    func didClickRename() {
        view?.showRenameDialog()
    }

    func didClickDelete() {
        if PinPreference.shared.saved {
            view?.showPinDialog(presenter: self)
        } else {
            router.presentDelete(wallet)
        }
    }

    func didChangeName(_ newName: String) {
        wallet.name = newName
        WalletStorage.shared.update(wallet)
        view?.showWalletName(wallet)
    }
}

extension WalletSettingPresenter : WalletSettingInteractorOutput {
    func accountFetched(_ account: AccountMetaDataPair) {
        view?.showWalletType("WalletType : " + (account.isMultisig ? "Multisig" : "Standard"))
    }

    func accountFetchFailed(_ error: Error) {
        view?.showWalletType("-")
    }
}
