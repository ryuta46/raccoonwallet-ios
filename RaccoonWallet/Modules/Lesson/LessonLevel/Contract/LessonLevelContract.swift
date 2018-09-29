//
//  LessonLevelContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

enum LessonLevel {
    case beginner
    case importer
    case expert
}

protocol LessonLevelView: BaseView {
    var presenter: LessonLevelPresentation! { get set }
}

protocol LessonLevelPresentation: BasePresentation {
    var view: LessonLevelView? { get set }
    var interactor: LessonLevelUseCase! { get set }
    var router: LessonLevelWireframe! { get set }
    
    func didClickBeginner()
    func didClickImport()
    func didClickExpert()
}

protocol LessonLevelUseCase: class {
    var output: LessonLevelInteractorOutput! { get set }
}

protocol LessonLevelInteractorOutput: class {
}

protocol LessonLevelWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
    
    func presentBeginner()
    func presentImport()
    func presentExpert()
}
