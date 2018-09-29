//
//  WalletSelectRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletSelectRouter: WalletSelectWireframe {

    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.walletSelectStoryboard.walletSelectView()!
        let presenter = WalletSelectPresenter()
        let interactor = WalletSelectInteractor()
        let router = WalletSelectRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view
        return view
    }

    func presentCreate() {
        if let navigationController = viewController?.navigationController {
            let view = WalletCreationTypeRouter.assembleModule()
            navigationController.pushViewController(view, animated: true)
        }
    }

    func presentSetting(for wallet: Wallet) {
        viewController?.pushWithNavigation(WalletSettingRouter.assembleModule(wallet))
    }

}
