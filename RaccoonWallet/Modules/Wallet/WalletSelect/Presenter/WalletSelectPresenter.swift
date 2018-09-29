//
//  WalletSelectPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletSelectPresenter: BasePresenter {
    weak var view: WalletSelectView?
    var interactor: WalletSelectUseCase!
    var router: WalletSelectWireframe!

    override func viewDidLoad() {
    }

    override func viewWillAppear() {
        interactor.fetchActiveId()
        interactor.fetchWallets()
    }
}

extension WalletSelectPresenter: WalletSelectPresentation {
    func didClickCreate() {
        router.presentCreate()
    }

    func didSelectWallet(_ wallet: Wallet) {
        interactor.activateWallet(wallet.id)
        interactor.fetchActiveId()
    }

    func didClickSetting(_ wallet: Wallet) {
        router.presentSetting(for: wallet)
    }
}

extension WalletSelectPresenter: WalletSelectInteractorOutput {
    func activeIdFetched(_ id: String?) {
        view?.showActiveId(id)
    }

    func walletsFetched(_ wallets: [Wallet]) {
        if wallets.isEmpty {
            view?.showWalletEmpty()
        } else {
            view?.showWallets(wallets)
        }

    }

}
