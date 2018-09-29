//
//  SendAmountRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/03.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendAmountRouter: SendAmountWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        let view = R.storyboard.sendAmountStoryboard.sendAmountView()!
        let presenter = SendAmountPresenter()
        let interactor = SendAmountInteractor()
        let router = SendAmountRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.sendTransaction = sendTransaction
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSendMode(_ sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendModeRouter.assembleModule(sendTransaction))
    }
}

