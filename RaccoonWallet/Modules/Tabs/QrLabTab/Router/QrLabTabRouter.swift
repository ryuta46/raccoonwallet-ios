//
//  QrLabTabRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class QrLabTabRouter: QrLabTabWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.qrLabTabStoryboard.qrLabTabView()!
        let presenter = QrLabTabPresenter()
        let interactor = QrLabTabInteractor()
        let router = QrLabTabRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentAmount() {
        viewController?.pushWithNavigation(QrLabAmountRouter.assembleModule())
    }
}

