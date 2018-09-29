//
//  LessonExpertRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonExpertRouter: LessonExpertWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.lessonExpertStoryboard.lessonExpertView()!
        let presenter = LessonExpertPresenter()
        let interactor = LessonExpertInteractor()
        let router = LessonExpertRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentBackup() {
        if let activeWallet = WalletHelper.activeWallet{
            viewController?.navigationController?.pushViewController(WalletBackupCautionRouter.assembleModule(
                    activeWallet,
                    from: .lessonExpert), animated: true)
        } else {
            // Fail safe
            viewController?.navigationController?.popToRootViewControllerFromBottom()
        }


    }
}

