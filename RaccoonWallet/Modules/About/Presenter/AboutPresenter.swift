//
//  AboutPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class AboutPresenter: BasePresenter {
    weak var view: AboutView?
    var interactor: AboutUseCase!
    var router: AboutWireframe!
}

extension AboutPresenter: AboutPresentation {
    func didClickOfficialSite() {
        router.presentOfficialSite()
    }

    func didClickDiscord() {
        router.presentDiscord()
    }

    func didClickOpenSource() {
        router.presentOpenSource()
    }

    func didClickReview() {
        if #available(iOS 10.3, *) {
            // iOS 10.3 or later -> In App review
            view?.showReviewInApp()
        } else {
            // earlier than iOS 10.3 -> Jump to App store
            router.presentReview()
        }
    }

    func didClickPrivacyPolicy() {
        router.presentPrivacyPolicy()
    }
}

extension AboutPresenter: AboutInteractorOutput {
}
