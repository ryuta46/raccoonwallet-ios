//
//  LessonBeginnerBackupEndContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol LessonBeginnerBackupEndView: BaseView, PinDialogMixinView {
    var presenter: LessonBeginnerBackupEndPresentation! { get set }

    func showPinAlreadySetDialog()
}

protocol LessonBeginnerBackupEndPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: LessonBeginnerBackupEndView? { get set }
    var interactor: LessonBeginnerBackupEndUseCase! { get set }
    var router: LessonBeginnerBackupEndWireframe! { get set }
    
    func didClickOk()

    func didClickAlreadySetOk()
}

protocol LessonBeginnerBackupEndUseCase: class {
    var output: LessonBeginnerBackupEndInteractorOutput! { get set }
}

protocol LessonBeginnerBackupEndInteractorOutput: class {
}

protocol LessonBeginnerBackupEndWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentPinEnd()
    func presentBeginnerEnd()
}
