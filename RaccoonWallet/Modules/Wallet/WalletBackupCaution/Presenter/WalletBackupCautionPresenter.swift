//
//  WalletBackupCautionPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletBackupCautionPresenter : BasePresenter {
    weak var view: WalletBackupCautionView?
    var interactor: WalletBackupCautionUseCase!
    var router: WalletBackupCautionWireframe!
    var origin: WalletBackupOrigin!
    var wallet: Wallet!
}

extension WalletBackupCautionPresenter : WalletBackupCautionPresentation {
    func didClickOk() {
        router.presentWalletBackup(wallet, from: origin)
    }
}

extension WalletBackupCautionPresenter : WalletBackupCautionInteractorOutput {
    
}
