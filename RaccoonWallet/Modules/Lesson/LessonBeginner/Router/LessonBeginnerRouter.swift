//
//  LessonBeginnerRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LessonBeginnerRouter: LessonBeginnerWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.lessonBeginnerStoryboard.lessonBeginnerView()!
        let presenter = LessonBeginnerPresenter()
        let interactor = LessonBeginnerInteractor()
        let router = LessonBeginnerRouter()
        
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
                    from: .lessonBeginner), animated: true)
        } else {
            // Fail safe
            viewController?.navigationController?.popToRootViewControllerFromBottom()
        }

    }
}

