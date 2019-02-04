//
//  LessonPinEndPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
class LessonPinEndPresenter: BasePresenter {
    weak var view: LessonPinEndView?
    var interactor: LessonPinEndUseCase!
    var router: LessonPinEndWireframe!
    var pin: String!
    var level: LessonLevel!
}

extension LessonPinEndPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        self.pin = pin
        view?.showBiometricsEnableDialog()
    }
}

extension LessonPinEndPresenter: LessonPinEndPresentation {
    func didClickSet() {
        if PinPreference.shared.saved {
            view?.showPinDialog(presenter: self)
        } else {
            view?.showError("Pin code must be set.")
        }
    }

    func didClickLessonEnd() {
        router.presentLessonEnd(level)
    }

    func didClickEnableBiometrics() {
        do {
            try PinPreference.shared.removeForBiometrics()
            ApplicationSetting.shared.isEnabledBiometry = false

            PinPreference.shared.saveForBiometrics(pin,
                    onSuccess: { [weak self] in
                        ApplicationSetting.shared.isEnabledBiometry = true
                        DispatchQueue.main.async {
                            self?.view?.showBiometricsSuccessDialog()
                        }

                    },
                    onError: { [weak self] error in
                        DispatchQueue.main.async {
                            self?.view?.showError(error.localizedDescription)
                        }
                    } )
        } catch let error {           
            view?.showError(error.localizedDescription)
        }
    }

    func didClickCancelBiometrics() {
        // Do nothing
    }

    func didClickSuccessOk() {
        router.presentLessonEnd(level)
    }
}

extension LessonPinEndPresenter : LessonPinEndInteractorOutput {
    
}
