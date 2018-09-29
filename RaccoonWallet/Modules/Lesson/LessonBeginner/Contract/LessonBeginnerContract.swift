//
//  LessonBeginnerContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol LessonBeginnerView: BaseView {
    var presenter: LessonBeginnerPresentation! { get set }
}

protocol LessonBeginnerPresentation: BasePresentation {
    var view: LessonBeginnerView? { get set }
    var interactor: LessonBeginnerUseCase! { get set }
    var router: LessonBeginnerWireframe! { get set }
    
    func didClickOk()
}

protocol LessonBeginnerUseCase: class {
    var output: LessonBeginnerInteractorOutput! { get set }
}

protocol LessonBeginnerInteractorOutput: class {
}

protocol LessonBeginnerWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
    func presentBackup()
}
