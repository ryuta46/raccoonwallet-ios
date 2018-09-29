//
//  LessonIntroductionContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol LessonIntroductionView: BaseView {
    var presenter: LessonIntroductionPresentation! { get set }
}

protocol LessonIntroductionPresentation: BasePresentation {
    var view: LessonIntroductionView? { get set }
    var interactor: LessonIntroductionUseCase! { get set }
    var router: LessonIntroductionWireframe! { get set }
    
    func didClickOk()
}

protocol LessonIntroductionUseCase: class {
    var output: LessonIntroductionInteractorOutput! { get set }
}

protocol LessonIntroductionInteractorOutput: class {
}

protocol LessonIntroductionWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
    
    func presentLessonLevel()
}
