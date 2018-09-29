//
//  LessonImporterContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol LessonImporterView: BaseView, PinDialogMixinView {
    var presenter: LessonImporterPresentation! { get set }

    func showPinAlreadySetDialog()
}

protocol LessonImporterPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: LessonImporterView? { get set }
    var interactor: LessonImporterUseCase! { get set }
    var router: LessonImporterWireframe! { get set }
    
    func didClickOk()

    func didClickAlreadySetOk()
}

protocol LessonImporterUseCase: class {
    var output: LessonImporterInteractorOutput! { get set }
}

protocol LessonImporterInteractorOutput: class {
}

protocol LessonImporterWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentPinEnd()
    func presentImporterEnd()
}
