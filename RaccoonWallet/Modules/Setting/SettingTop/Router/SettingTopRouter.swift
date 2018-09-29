//
//  SettingTopRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SettingTopRouter: SettingTopWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.settingTopStoryboard.settingTopView()!
        let presenter = SettingTopPresenter()
        let interactor = SettingTopInteractor()
        let router = SettingTopRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentNodeSelect() {
        viewController?.pushWithNavigation(NodeSelectRouter.assembleModule())
    }

    func presentSecurityLesson() {
        viewController?.pushWithNavigation(LessonIntroductionRouter.assembleModule())
    }
}

