//
//  WalletNewNameRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletNewNameRouter: WalletNewNameWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.walletNewNameStoryboard.walletNewNameView()!
        let presenter = WalletNewNamePresenter()
        let interactor = WalletNewNameInteractor()
        let router = WalletNewNameRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view
        return view
    }

    func presentWalletNewCompleted(_ name: String) {
        if let navigationController = viewController?.navigationController {
            let view = WalletNewCompletedRouter.assembleModule(name: name)
            navigationController.pushViewController(view, animated: true)
        }

    }

    func presentPrivacyPolicy() {
        ExternalLink.open(url: Constant.privacyPolicyUrl)
    }

}
