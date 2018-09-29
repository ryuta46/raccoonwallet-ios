//
//  HomeTabRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class HomeTabRouter: HomeTabWireframe {
    weak var viewController: UIViewController?

    static func assembleModule() -> UIViewController {
        let view = R.storyboard.homeTabStoryboard.homeTabView()!
        let presenter = HomeTabPresenter()
        let interactor = HomeTabInteractor()
        let router = HomeTabRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = view

        return view
    }

    func presentBalance() {
        viewController?.pushWithNavigation(BalanceDetailRouter.assembleModule())
    }
    func presentTransaction() {
        viewController?.pushWithNavigation(TransactionListRouter.assembleModule())
    }

    func presentHarvest() {
    }

}
