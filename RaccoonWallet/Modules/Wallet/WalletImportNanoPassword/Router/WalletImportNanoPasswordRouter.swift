//
//  WalletImportNanoPasswordRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletImportNanoPasswordRouter: WalletImportNanoPasswordWireframe {

    weak var viewController: UIViewController?

    static func assembleModule(_ handler: ((String?) -> Void)? = nil) -> UIViewController {
        let view = R.storyboard.walletImportNanoPasswordStoryboard.walletImportNanoPasswordView()!
        let presenter = WalletImportNanoPasswordPresenter()
        let interactor = WalletImportNanoPasswordInteractor()
        let router = WalletImportNanoPasswordRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.handler = handler
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss(_ password: String?, _ handler: ((String?) -> Void)?) {
        viewController?.dismiss(animated: true) { handler?(password) }
    }
}

