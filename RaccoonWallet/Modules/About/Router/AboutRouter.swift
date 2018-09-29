//
//  AboutRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class AboutRouter: AboutWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.aboutStoryboard.aboutView()!
        let presenter = AboutPresenter()
        let interactor = AboutInteractor()
        let router = AboutRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentOfficialSite() {
        ExternalLink.open(url: Constant.officialSiteUrl)
    }

    func presentDiscord() {
        ExternalLink.open(url: Constant.discordInvitationUrl)
    }

    func presentOpenSource() {
        ExternalLink.open(url: Constant.openSourceUrl)

    }

    func presentReview() {
        //BrowserLink.open(url: Constant.
    }

    func presentPrivacyPolicy() {
        ExternalLink.open(url: Constant.privacyPolicyUrl)
    }
}

