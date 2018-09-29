//
//  NodeSelectRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class NodeSelectRouter: NodeSelectWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.nodeSelectStoryboard.nodeSelectView()!
        let presenter = NodeSelectPresenter()
        let interactor = NodeSelectInteractor()
        let router = NodeSelectRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }
}

