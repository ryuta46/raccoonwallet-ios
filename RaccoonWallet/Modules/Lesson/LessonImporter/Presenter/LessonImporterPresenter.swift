//
//  LessonImporterPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class LessonImporterPresenter: BasePresenter {
    weak var view: LessonImporterView?
    var interactor: LessonImporterUseCase!
    var router: LessonImporterWireframe!
}

extension LessonImporterPresenter: LessonImporterPresentation {
    func didClickOk() {
        if PinPreference.shared.saved {
            // skip pin registration
            view?.showPinAlreadySetDialog()
        } else {
            view?.showPinDialog(forRegistration: true, presenter: self)
        }
    }

    func didRegisterPin(_ pin: String) {
        let biometrics = LocalAuthenticationHelper.checkBiometrics()
        if biometrics == .none {
            // skip biometrics settings if biometrics is not available.
            router.presentImporterEnd()
        } else {
            router.presentPinEnd()
        }
    }

    func didClickAlreadySetOk() {
        router.presentImporterEnd()
    }
}

extension LessonImporterPresenter: LessonImporterInteractorOutput {
    
}
