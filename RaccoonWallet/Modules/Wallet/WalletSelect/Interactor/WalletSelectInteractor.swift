//
//  WalletSelectInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletSelectInteractor: WalletSelectUseCase {
    weak var output: WalletSelectInteractorOutput!

    func activateWallet(_ id: String) {
        ApplicationSetting.shared.activeWalletId = id
    }

    func fetchActiveId() {
        output.activeIdFetched(ApplicationSetting.shared.activeWalletId)
    }

    func fetchWallets() {
        let wallets = WalletStorage.shared.all
        output.walletsFetched(wallets)
    }
}
