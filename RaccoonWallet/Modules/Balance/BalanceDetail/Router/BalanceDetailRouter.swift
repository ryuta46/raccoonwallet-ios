//
//  BalanceDetailRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/09.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class BalanceDetailRouter: BalanceDetailWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.balanceDetailStoryboard.balanceDetailView()!
        let presenter = BalanceDetailPresenter()
        let interactor = BalanceDetailInteractor()
        let router = BalanceDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }
}

