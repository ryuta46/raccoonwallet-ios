//
//  TopRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class TopRouter: TopWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.topStoryboard.topView()!
        let presenter = TopPresenter()
        let interactor = TopInteractor()
        let router = TopRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view
        return view
    }
}
