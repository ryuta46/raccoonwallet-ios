//
//  LessonEndContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol LessonEndView: BaseView {
    var presenter: LessonEndPresentation! { get set }

    func showText(_ level: LessonLevel)
}

protocol LessonEndPresentation: BasePresentation {
    var view: LessonEndView? { get set }
    var interactor: LessonEndUseCase! { get set }
    var router: LessonEndWireframe! { get set }

    func didClickOk()
}

protocol LessonEndUseCase: class {
    var output: LessonEndInteractorOutput! { get set }
}

protocol LessonEndInteractorOutput: class {
}

protocol LessonEndWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ level: LessonLevel) -> UIViewController
    func goBackHome()
}
