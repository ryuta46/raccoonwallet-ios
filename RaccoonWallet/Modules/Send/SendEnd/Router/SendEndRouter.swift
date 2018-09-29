//
//  SendEndRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendEndRouter: SendEndWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.sendEndStoryboard.sendEndView()!
        let presenter = SendEndPresenter()
        let interactor = SendEndInteractor()
        let router = SendEndRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func goBackHome() {
        viewController?.resetRootViewController()
        viewController?.navigationController?.popToRootViewControllerFromBottom()
    }

    func presentTransaction() {
        viewController?.resetRootViewController()
        viewController?.pushWithNavigation(TransactionListRouter.assembleModule())
        viewController?.navigationController?.removeHistoryUntil(TopViewController.self)
    }
}

