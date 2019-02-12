//
//  SettingTopPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class SettingTopPresenter: BasePresenter {
    weak var view: SettingTopView?
    var interactor: SettingTopUseCase!
    var router: SettingTopWireframe!
    var pin: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.showIsBiometricsRequired(ApplicationSetting.shared.isEnabledBiometry)
        view?.showIsPinRequiredOnLaunch(ApplicationSetting.shared.isPinRequiredOnLaunch)
    }
}

extension SettingTopPresenter: SettingTopPresentation {
    func didClickNodeSelect() {
        router.presentNodeSelect()
    }

    func didClickLanguageSelect() {
        view?.showInfo(R.string.localizable.common_coming_soon())
    }
    
    func didClickCurrencySelect() {
        view?.showInfo(R.string.localizable.common_coming_soon())
    }


    func didClickNotificationSetting() {
        view?.showInfo(R.string.localizable.common_coming_soon())
    }

    func didClickChangePassword() {
        view?.showPinDialogForRegistration()
    }

    func didRegisterPin(_ pin: String) {
        // Registering new pin clears biometrics
        try? PinPreference.shared.removeForBiometrics()
        ApplicationSetting.shared.isEnabledBiometry = false
        view?.showIsBiometricsRequired(false)
    }

    func didChangeIsBiometricsRequired(_ isBiometricsRequired: Bool) {
        if isBiometricsRequired {
            if PinPreference.shared.saved {
                view?.showPinDialogForBiometrics()
            } else {
                view?.showPinNotAvailableDialog()
                DispatchQueue.main.async {
                    self.view?.showIsBiometricsRequired(false)
                }
            }
        } else {
            try? PinPreference.shared.removeForBiometrics()
            ApplicationSetting.shared.isEnabledBiometry = false
        }
    }

    func didValidatePinForBiometrics(_ pin: String) {
        self.pin = pin
        view?.showBiometricsEnableDialog()
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
        view?.showIsBiometricsRequired(false)
    }

    func didChangeIsPinRequiredOnLaunch(_ isPinRequiredOnLaunch: Bool) {
        if isPinRequiredOnLaunch && !PinPreference.shared.saved {
            view?.showPinNotAvailableDialog()
            DispatchQueue.main.async {
                self.view?.showIsPinRequiredOnLaunch(false)
            }
        } else {
            ApplicationSetting.shared.isPinRequiredOnLaunch = isPinRequiredOnLaunch
        }
    }

    func didClickGoToSecurityLesson() {
        router.presentSecurityLesson()
    }
}

extension SettingTopPresenter: SettingTopInteractorOutput {
}
