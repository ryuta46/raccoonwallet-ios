//
//  IntroductionConceptRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class IntroductionConceptRouter: IntroductionConceptWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.introductionConceptStoryboard.introductionConceptView()!
        let presenter = IntroductionConceptPresenter()
        let interactor = IntroductionConceptInteractor()
        let router = IntroductionConceptRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentIntroductionMessage() {
        // Create navigation controller and present
        let rootController = RootRouter.assembleRootController(withFront: IntroductionMessageRouter.assembleModule())

        viewController?.present(rootController, animated: true)
    }
}

