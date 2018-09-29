//
//  LessonIntroductionRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonIntroductionRouter: LessonIntroductionWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.lessonIntroductionStoryboard.lessonIntroductionView()!
        let presenter = LessonIntroductionPresenter()
        let interactor = LessonIntroductionInteractor()
        let router = LessonIntroductionRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentLessonLevel() {
        viewController?.navigationController?.pushViewController(LessonLevelRouter.assembleModule(), animated: true)
    }
}

