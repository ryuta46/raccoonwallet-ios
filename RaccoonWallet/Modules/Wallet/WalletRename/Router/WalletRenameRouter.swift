//
//  WalletRenameRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletRenameRouter: WalletRenameWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ handler: ((String?) -> Void)? = nil) -> UIViewController {
        let view = R.storyboard.walletRenameStoryboard.walletRenameView()!
        let presenter = WalletRenamePresenter()
        let interactor = WalletRenameInteractor()
        let router = WalletRenameRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.handler = handler
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss(_ newName: String?, _ handler: ((String?) -> Void)?) {
        viewController?.dismiss(animated: true) {
            handler?(newName)
        }
    }
}

