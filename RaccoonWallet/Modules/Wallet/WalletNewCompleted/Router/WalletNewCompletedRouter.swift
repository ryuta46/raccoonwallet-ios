//
//  WalletNewCompletedRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletNewCompletedRouter: WalletNewCompletedWireframe {
    weak var viewController: UIViewController?

    static func assembleModule(name: String) -> UIViewController {
        let view = R.storyboard.walletNewCompletedStoryboard.walletNewCompletedView()!
        let presenter = WalletNewCompletedPresenter()
        let interactor = WalletNewCompletedInteractor()
        let router = WalletNewCompletedRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.name = name

        interactor.output = presenter

        router.viewController = view
        return view
    }

    func presentWalletNewEnd() {
        if let navigationController = viewController?.navigationController {
            let view = WalletNewEndRouter.assembleModule()
            navigationController.pushViewController(view, animated: true)
        }

    }

    func goBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }


}
