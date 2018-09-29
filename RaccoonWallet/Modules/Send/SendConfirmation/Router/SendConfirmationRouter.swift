//
//  SendConfirmationRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendConfirmationRouter: SendConfirmationWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController {
        let view = R.storyboard.sendConfirmationStoryboard.sendConfirmationView()!
        let presenter = SendConfirmationPresenter()
        let interactor = SendConfirmationInteractor()
        let router = SendConfirmationRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.sendTransaction = sendTransaction
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSendEnd() {
        viewController?.pushWithNavigation(SendEndRouter.assembleModule())
    }
}

