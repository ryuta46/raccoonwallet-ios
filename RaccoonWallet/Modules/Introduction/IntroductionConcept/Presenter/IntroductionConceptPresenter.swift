//
//  IntroductionConceptPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class IntroductionConceptPresenter: BasePresenter {
    weak var view: IntroductionConceptView?
    var interactor: IntroductionConceptUseCase!
    var router: IntroductionConceptWireframe!
}

extension IntroductionConceptPresenter: IntroductionConceptPresentation {
    func didChangePage(_ page: Int) {
    }

    func didClickGetStarted() {
        ApplicationSetting.shared.isFirstLaunch = false
        router.presentIntroductionMessage()
    }
}

extension IntroductionConceptPresenter: IntroductionConceptInteractorOutput {
}
