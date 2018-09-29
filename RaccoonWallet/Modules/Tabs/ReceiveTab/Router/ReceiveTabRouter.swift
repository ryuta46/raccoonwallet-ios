//
//  ReceiveTabRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/01.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class ReceiveTabRouter: ReceiveTabWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.receiveTabStoryboard.receiveTabView()!
        let presenter = ReceiveTabPresenter()
        let interactor = ReceiveTabInteractor()
        let router = ReceiveTabRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }
}

