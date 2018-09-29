//
//  AboutContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol AboutView: BaseView {
    var presenter: AboutPresentation! { get set }

    func showReviewInApp()
}

//sourcery: AutoMockable
protocol AboutPresentation: BasePresentation {
    var view: AboutView? { get set }
    var interactor: AboutUseCase! { get set }
    var router: AboutWireframe! { get set }

    func didClickOfficialSite()
    func didClickDiscord()
    func didClickOpenSource()
    func didClickReview()
    func didClickPrivacyPolicy()
}

//sourcery: AutoMockable
protocol AboutUseCase: class {
    var output: AboutInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol AboutInteractorOutput: class {
}

//sourcery: AutoMockable
protocol AboutWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentOfficialSite()
    func presentDiscord()
    func presentOpenSource()
    func presentReview()
    func presentPrivacyPolicy()
}
