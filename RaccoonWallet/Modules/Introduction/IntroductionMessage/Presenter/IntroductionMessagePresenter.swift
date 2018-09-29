//
//  IntroductionMessagePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class IntroductionMessagePresenter: BasePresenter {
    weak var view: IntroductionMessageView?
    var interactor: IntroductionMessageUseCase!
    var router: IntroductionMessageWireframe!
}

extension IntroductionMessagePresenter: IntroductionMessagePresentation {
    func didClickOk() {
        router.presentCreateWallet()
    }
}

extension IntroductionMessagePresenter: IntroductionMessageInteractorOutput {
}
