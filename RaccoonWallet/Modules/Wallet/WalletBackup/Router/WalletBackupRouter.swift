//
//  WalletBackupRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletBackupRouter: WalletBackupWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ wallet: Wallet, from origin: WalletBackupOrigin) -> UIViewController {
        let view = R.storyboard.walletBackupStoryboard.walletBackupView()!
        let presenter = WalletBackupPresenter()
        let interactor = WalletBackupInteractor()
        let router = WalletBackupRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.origin = origin
        presenter.wallet = wallet
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func goBack(to origin: WalletBackupOrigin) {
        if let navigationController = viewController?.navigationController {
            switch origin {
            case .lessonBeginner: navigationController.pushViewController(LessonBeginnerBackupEndRouter.assembleModule(), animated: true)
            case .lessonExpert: navigationController.pushViewController(LessonEndRouter.assembleModule(.expert), animated: true)
            case .walletSetting:
                navigationController.popViewController(animated: true)
                navigationController.popViewController(animated: true)

            }
        }
    }
}

