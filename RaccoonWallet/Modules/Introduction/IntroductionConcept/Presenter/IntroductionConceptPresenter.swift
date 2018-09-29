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

    let messages = [
        R.string.localizable.first_tutorial_message1(),
        R.string.localizable.first_tutorial_message2(),
        R.string.localizable.first_tutorial_message3(),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.showMessage(messages[0])
        view?.hideGetStarted()
    }
}

extension IntroductionConceptPresenter: IntroductionConceptPresentation {
    func didChangePage(_ page: Int) {
        guard let message = messages[safe: page] else {
            return
        }
        view?.showMessage(message)

        if page == messages.count - 1 {
            view?.showGetStarted()
        } else {
            view?.hideGetStarted()
        }
    }

    func didClickGetStarted() {
        ApplicationSetting.shared.isFirstLaunch = false
        router.presentIntroductionMessage()
    }
}

extension IntroductionConceptPresenter: IntroductionConceptInteractorOutput {
}
