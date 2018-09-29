//
//  LessonPinEndContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

protocol LessonPinEndView: BaseView, PinDialogMixinView {
    var presenter: LessonPinEndPresentation! { get set }

    func showBiometricsEnableDialog()
    func showBiometricsSuccessDialog()
}

protocol LessonPinEndPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: LessonPinEndView? { get set }
    var interactor: LessonPinEndUseCase! { get set }
    var router: LessonPinEndWireframe! { get set }
    
    func didClickSet()
    func didClickLessonEnd()

    func didClickEnableBiometrics()
    func didClickCancelBiometrics()
    func didClickSuccessOk()
}

protocol LessonPinEndUseCase: class {
    var output: LessonPinEndInteractorOutput! { get set }
}

protocol LessonPinEndInteractorOutput: class {
}

protocol LessonPinEndWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ level: LessonLevel) -> UIViewController

    func presentLessonEnd(_ level: LessonLevel)
}
