//
//  DonationDetailRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/12.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class DonationDetailRouter: DonationDetailWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ developer: Developer) -> UIViewController {
        let view = R.storyboard.donationDetailStoryboard.donationDetailView()!
        let presenter = DonationDetailPresenter()
        let interactor = DonationDetailInteractor()
        let router = DonationDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.developer = developer
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSendAmount(sendTransaction: SendTransaction) {
        viewController?.pushWithNavigation(SendAmountRouter.assembleModule(sendTransaction))
    }

    func presentSetting() {
        viewController?.pushWithNavigation(SettingTopRouter.assembleModule())
    }
    func presentWalletSelect() {
        viewController?.navigationController?.pushViewControllerFromTop(WalletSelectRouter.assembleModule())
    }

    func openUrl(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        ExternalLink.open(url: url)
    }
}

