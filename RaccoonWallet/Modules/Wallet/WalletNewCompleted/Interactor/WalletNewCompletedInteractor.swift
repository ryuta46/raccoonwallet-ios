//
//  WalletNewCompletedInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletNewCompletedInteractor: WalletNewCompletedUseCase {
    weak var output: WalletNewCompletedInteractorOutput!

    func createWallet(name: String, pin: String) {
        do {
            let wallet = try WalletHelper.createWallet(name: name, password: pin)
            WalletStorage.shared.add(wallet)
            output.walletCreated(wallet: wallet)
            ApplicationSetting.shared.activeWalletId = wallet.id
        } catch let error {
            Logger.shared.error(error.localizedDescription)
            output.walletCreateFailed()
        }
    }

}
