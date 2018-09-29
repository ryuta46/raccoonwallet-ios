//
//  LessonExpertContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol LessonExpertView: BaseView {
    var presenter: LessonExpertPresentation! { get set }
}

protocol LessonExpertPresentation: BasePresentation {
    var view: LessonExpertView? { get set }
    var interactor: LessonExpertUseCase! { get set }
    var router: LessonExpertWireframe! { get set }
    
    func didClickOk()
}

protocol LessonExpertUseCase: class {
    var output: LessonExpertInteractorOutput! { get set }
}

protocol LessonExpertInteractorOutput: class {
}

protocol LessonExpertWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentBackup()
}
