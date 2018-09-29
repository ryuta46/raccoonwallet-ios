//
//  SendTabRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/02.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendTabRouter: SendTabWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.sendTabStoryboard.sendTabView()!
        let presenter = SendTabPresenter()
        let interactor = SendTabInteractor()
        let router = SendTabRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSendAmount(destination: String, destinationPublicKey: String?) {
        viewController?.pushWithNavigation(
                SendAmountRouter.assembleModule(
                        SendTransaction(
                                address: destination,
                                publicKey: destinationPublicKey
                        )
                )
        )
    }

    func presentSetting() {
        viewController?.pushWithNavigation(SettingTopRouter.assembleModule())
    }
    func presentWalletSelect() {
        viewController?.navigationController?.pushViewControllerFromTop(WalletSelectRouter.assembleModule())
    }

}

