//
//  LessonEndRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonEndRouter: LessonEndWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ level: LessonLevel) -> UIViewController {
        let view = R.storyboard.lessonEndStoryboard.lessonEndView()!
        let presenter = LessonEndPresenter()
        let interactor = LessonEndInteractor()
        let router = LessonEndRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.level = level
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func goBackHome() {
        viewController?.resetRootViewController()
        viewController?.navigationController?.popToRootViewControllerFromBottom()
    }
}
