//
//  WalletNewEndRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletNewEndRouter: WalletNewEndWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.walletNewEndStoryboard.walletNewEndView()!
        let presenter = WalletNewEndPresenter()
        let interactor = WalletNewEndInteractor()
        let router = WalletNewEndRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view
        return view
    }

    func presentLesson() {
        viewController?.pushWithNavigation(LessonIntroductionRouter.assembleModule())
    }

    func goBackHome() {
        viewController?.resetRootViewController()
        viewController?.navigationController?.popToRootViewControllerFromBottom()
    }
}

