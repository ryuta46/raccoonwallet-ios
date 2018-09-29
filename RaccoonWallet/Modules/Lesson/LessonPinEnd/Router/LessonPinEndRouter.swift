//
//  LessonPinEndRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonPinEndRouter: LessonPinEndWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ level: LessonLevel) -> UIViewController {
        let view = R.storyboard.lessonPinEndStoryboard.lessonPinEndView()!
        let presenter = LessonPinEndPresenter()
        let interactor = LessonPinEndInteractor()
        let router = LessonPinEndRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.level = level
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentSettingDialog() {
    }

    private func presentSettingDialogWith(pin: String) {
    }

    func presentLessonEnd(_ level: LessonLevel) {
        viewController?.navigationController?.pushViewController(LessonEndRouter.assembleModule(level), animated: true)
    }
}

