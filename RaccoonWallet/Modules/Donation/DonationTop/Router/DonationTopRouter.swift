//
//  DonationTopRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class DonationTopRouter: DonationTopWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.donationTopStoryboard.donationTopView()!
        let presenter = DonationTopPresenter()
        let interactor = DonationTopInteractor()
        let router = DonationTopRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentDonationDetail(_ developer: Developer) {
        viewController?.pushWithNavigation(DonationDetailRouter.assembleModule(developer))
    }
}

