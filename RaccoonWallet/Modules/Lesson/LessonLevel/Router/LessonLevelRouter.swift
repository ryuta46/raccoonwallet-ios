//
//  LessonLevelRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonLevelRouter: LessonLevelWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.lessonLevelStoryboard.lessonLevelView()!
        let presenter = LessonLevelPresenter()
        let interactor = LessonLevelInteractor()
        let router = LessonLevelRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }
    
    func presentBeginner() {
        viewController?.navigationController?.pushViewController(LessonBeginnerRouter.assembleModule(), animated: true)
    }
    
    func presentImport() {
        viewController?.navigationController?.pushViewController(LessonImporterRouter.assembleModule(), animated: true)
    }
    
    func presentExpert() {
        viewController?.navigationController?.pushViewController(LessonExpertRouter.assembleModule(), animated: true)
    }
}

