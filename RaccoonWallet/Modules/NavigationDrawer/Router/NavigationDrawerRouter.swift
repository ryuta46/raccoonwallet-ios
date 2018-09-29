//
//  NavigationDrawerRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import REFrostedViewController

class NavigationDrawerRouter: NavigationDrawerWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.navigationDrawerStoryboard.navigationDrawerView()!
        let presenter = NavigationDrawerPresenter()
        let interactor = NavigationDrawerInteractor()
        let router = NavigationDrawerRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss() {
        viewController?.frostedViewController.hideMenuViewController()
    }

    func presentAddressBook() {
    }

    func presentGallery() {
        present(MosaicListRouter.assembleModule())
    }

    func presentDonation() {
        present(DonationTopRouter.assembleModule())
    }

    func presentAbout() {
        present(AboutRouter.assembleModule())
    }

    func presentHelp() {
        ExternalLink.open(url: Constant.helpUrl)
    }

    func presentSetting() {
        present(SettingTopRouter.assembleModule())
    }

    private func present(_ destinationViewController: UIViewController) {
        if let navigationController = viewController?.frostedViewController.contentViewController as? UINavigationController {
            dismiss()
            navigationController.pushViewController(destinationViewController, animated: true)
        }
    }
}

