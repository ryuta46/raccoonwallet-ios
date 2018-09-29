//
//  WalletImportNameRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletImportNameRouter: WalletImportNameWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.walletImportNameStoryboard.walletImportNameView()!
        let presenter = WalletImportNamePresenter()
        let interactor = WalletImportNameInteractor()
        let router = WalletImportNameRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentImportEnd() {
        viewController?.pushWithNavigation(WalletImportEndRouter.assembleModule())
    }
}

