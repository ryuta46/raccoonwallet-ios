//
//  LessonBeginnerBackupEndRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonBeginnerBackupEndRouter: LessonBeginnerBackupEndWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.lessonBeginnerBackupEndStoryboard.lessonBeginnerBackupEndView()!
        let presenter = LessonBeginnerBackupEndPresenter()
        let interactor = LessonBeginnerBackupEndInteractor()
        let router = LessonBeginnerBackupEndRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentPinEnd() {
        viewController?.navigationController?.pushViewController(LessonPinEndRouter.assembleModule(.beginner), animated: true)
    }

    func presentBeginnerEnd() {
        viewController?.navigationController?.pushViewController(LessonEndRouter.assembleModule(.beginner), animated: true)
    }
}

