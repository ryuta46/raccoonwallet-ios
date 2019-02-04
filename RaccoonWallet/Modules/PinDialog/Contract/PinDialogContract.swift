//
//  PinDialogContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol PinDialogView: BaseView {
    var presenter: PinDialogPresentation! { get set }

    func showMessage(_ message: String)
    func showInputted(_ count: Int)
    func showResult(_ result: Bool)

    func showRegistrationMessage()

    func hideCancel()
}

//sourcery: AutoMockable
protocol PinDialogPresentation: BasePresentation {
    var view: PinDialogView? { get set }
    var interactor: PinDialogUseCase! { get set }
    var router: PinDialogWireframe! { get set }
    
    func didClickNumber(_ number: Int)
    func didClickCancel()
}

//sourcery: AutoMockable
protocol PinDialogUseCase: class {
    var output: PinDialogInteractorOutput! { get set }

    func validateCode(_ pin: String)
    func registerCode(_ oldCode: String, _ newCode: String)
}

//sourcery: AutoMockable
protocol PinDialogInteractorOutput: class {
    func pinValidated(_ result: Bool, _ pin: String)
    func pinRegistered(_ result: Bool, _ pin: String)
}

//sourcery: AutoMockable
protocol PinDialogWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(
        forRegistration: Bool,
        cancelable: Bool,
        message: String?,
        handler: ((String?) -> Void)?) -> UIViewController

    func dismiss(pin: String?, _ handler: ((String?) -> Void)?)
}

