//
//  WalletDetailRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletDetailRouter: WalletDetailWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ wallet: Wallet) -> UIViewController {
        let view = R.storyboard.walletDetailStoryboard.walletDetailView()!
        let presenter = WalletDetailPresenter()
        let interactor = WalletDetailInteractor()
        let router = WalletDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.wallet = wallet
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }
}

