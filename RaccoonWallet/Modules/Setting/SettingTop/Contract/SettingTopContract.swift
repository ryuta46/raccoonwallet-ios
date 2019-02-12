//
//  SettingTopContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol SettingTopView: BaseView {
    var presenter: SettingTopPresentation! { get set }

    func showPinDialogForRegistration()
    func showPinDialogForBiometrics()
    func showBiometricsEnableDialog()
    func showBiometricsSuccessDialog()

    func showIsBiometricsRequired(_ isBiometricsRequired: Bool)
    func showIsPinRequiredOnLaunch(_ isPinRequiredOnLaunch: Bool)
    func showPinNotAvailableDialog()
}

//sourcery: AutoMockable
protocol SettingTopPresentation: BasePresentation {
    var view: SettingTopView? { get set }
    var interactor: SettingTopUseCase! { get set }
    var router: SettingTopWireframe! { get set }

    func didClickNodeSelect()
    func didClickLanguageSelect()
    func didClickCurrencySelect()
    func didClickNotificationSetting()

    func didClickChangePassword()
    func didRegisterPin(_ pin: String)

    func didChangeIsBiometricsRequired(_ isBiometricsRequired: Bool)
    func didValidatePinForBiometrics(_ pin: String)
    func didClickEnableBiometrics()
    func didClickCancelBiometrics()

    func didChangeIsPinRequiredOnLaunch(_ isPinRequiredOnLaunch: Bool)
    func didClickGoToSecurityLesson()
}

//sourcery: AutoMockable
protocol SettingTopUseCase: class {
    var output: SettingTopInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol SettingTopInteractorOutput: class {
}

//sourcery: AutoMockable
protocol SettingTopWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentNodeSelect()
    func presentSecurityLesson()
}
