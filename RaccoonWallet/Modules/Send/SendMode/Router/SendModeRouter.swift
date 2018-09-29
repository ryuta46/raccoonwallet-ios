//
//  SendModeRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendModeRouter: SendModeWireframe {
    weak var viewController: UIViewController?

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        let view = R.storyboard.sendModeStoryboard.sendModeView()!
        let presenter = SendModePresenter()
        let interactor = SendModeInteractor()
        let router = SendModeRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.sendTransaction = sendTransaction
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSendConfirmation(_ sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendConfirmationRouter.assembleModule(sendTransaction))
    }

    func presentSendMessageType(_ sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendMessageTypeRouter.assembleModule(sendTransaction))
    }
}

