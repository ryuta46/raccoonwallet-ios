//
//  ScanTabRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class ScanTabRouter: ScanTabWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.scanTabStoryboard.scanTabView()!
        let presenter = ScanTabPresenter()
        let interactor = ScanTabInteractor()
        let router = ScanTabRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSendAmount(_ sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendAmountRouter.assembleModule(sendTransaction))
    }

    func presentSendMode(_ sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendModeRouter.assembleModule(sendTransaction))
    }

    func presentSendConfirmation(_ sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendConfirmationRouter.assembleModule(sendTransaction))
    }

    func presentSetting() {
        viewController?.pushWithNavigation(SettingTopRouter.assembleModule())
    }
    func presentWalletSelect() {
        viewController?.navigationController?.pushViewControllerFromTop(WalletSelectRouter.assembleModule())
    }
}

