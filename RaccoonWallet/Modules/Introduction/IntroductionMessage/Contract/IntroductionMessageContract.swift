//
//  IntroductionMessageContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol IntroductionMessageView: BaseView {
    var presenter: IntroductionMessagePresentation! { get set }
}

//sourcery: AutoMockable
protocol IntroductionMessagePresentation: BasePresentation {
    var view: IntroductionMessageView? { get set }
    var interactor: IntroductionMessageUseCase! { get set }
    var router: IntroductionMessageWireframe! { get set }

    func didClickOk()
}

//sourcery: AutoMockable
protocol IntroductionMessageUseCase: class {
    var output: IntroductionMessageInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol IntroductionMessageInteractorOutput: class {
}

//sourcery: AutoMockable
protocol IntroductionMessageWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentCreateWallet()
}
