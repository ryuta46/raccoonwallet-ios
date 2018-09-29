//
//  WalletSettingRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletSettingRouter: WalletSettingWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ wallet: Wallet) -> UIViewController {
        let view = R.storyboard.walletSettingStoryboard.walletSettingView()!
        let presenter = WalletSettingPresenter()
        let interactor = WalletSettingInteractor()
        let router = WalletSettingRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.wallet = wallet
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentDetail(_ wallet: Wallet) {
        viewController?.pushWithNavigation(WalletDetailRouter.assembleModule(wallet))
    }

    func presentAddress(_ wallet: Wallet) {
        viewController?.pushWithNavigation(WalletAddressRouter.assembleModule(wallet))
    }

    func presentBackup(_ wallet: Wallet) {
        viewController?.pushWithNavigation(WalletBackupCautionRouter.assembleModule(wallet, from: .walletSetting))
    }

    func presentDelete(_ wallet: Wallet) {
        viewController?.pushWithNavigation(WalletDeleteRouter.assembleModule(wallet))
    }


}

