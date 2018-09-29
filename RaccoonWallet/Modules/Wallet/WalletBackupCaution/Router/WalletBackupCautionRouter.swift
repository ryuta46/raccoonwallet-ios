//
//  WalletBackupCautionRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletBackupCautionRouter: WalletBackupCautionWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ wallet: Wallet, from origin: WalletBackupOrigin) -> UIViewController {
        let view = R.storyboard.walletBackupCautionStoryboard.walletBackupCautionView()!
        let presenter = WalletBackupCautionPresenter()
        let interactor = WalletBackupCautionInteractor()
        let router = WalletBackupCautionRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.wallet = wallet
        presenter.origin = origin

        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentWalletBackup(_ wallet: Wallet, from origin: WalletBackupOrigin) {
        viewController?.navigationController?.pushViewController(WalletBackupRouter.assembleModule(wallet, from: origin), animated: true)
    }
}

