//
//  IntroductionConceptContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol IntroductionConceptView: BaseView {
    var presenter: IntroductionConceptPresentation! { get set }
}

//sourcery: AutoMockable
protocol IntroductionConceptPresentation: BasePresentation {
    var view: IntroductionConceptView? { get set }
    var interactor: IntroductionConceptUseCase! { get set }
    var router: IntroductionConceptWireframe! { get set }

    func didChangePage(_ page: Int)
    func didClickGetStarted()
}

//sourcery: AutoMockable
protocol IntroductionConceptUseCase: class {
    var output: IntroductionConceptInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol IntroductionConceptInteractorOutput: class {
}

//sourcery: AutoMockable
protocol IntroductionConceptWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentIntroductionMessage()
}
