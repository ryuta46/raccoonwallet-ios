//
//  WalletImportKeyRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletImportKeyRouter: WalletImportKeyWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.walletImportKeyStoryboard.walletImportKeyView()!
        let presenter = WalletImportKeyPresenter()
        let interactor = WalletImportKeyInteractor()
        let router = WalletImportKeyRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentWalletImportName() {
        viewController?.pushWithNavigation(WalletImportNameRouter.assembleModule())
    }

    func presentWalletImportEnd() {
        viewController?.pushWithNavigation(WalletImportEndRouter.assembleModule())
    }

    func presentPrivacyPolicy() {
        ExternalLink.open(url: Constant.privacyPolicyUrl)
    }
}

