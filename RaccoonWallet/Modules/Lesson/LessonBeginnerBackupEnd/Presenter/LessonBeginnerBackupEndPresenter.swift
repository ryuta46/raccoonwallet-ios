//
//  LessonBeginnerBackupEndPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class LessonBeginnerBackupEndPresenter : BasePresenter {
    weak var view: LessonBeginnerBackupEndView?
    var interactor: LessonBeginnerBackupEndUseCase!
    var router: LessonBeginnerBackupEndWireframe!
}

extension LessonBeginnerBackupEndPresenter: LessonBeginnerBackupEndPresentation {
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
            router.presentBeginnerEnd()
        } else {
            router.presentPinEnd()
        }

    }

    func didClickAlreadySetOk() {
        router.presentBeginnerEnd()
    }
}

extension LessonBeginnerBackupEndPresenter : LessonBeginnerBackupEndInteractorOutput {
    
}
