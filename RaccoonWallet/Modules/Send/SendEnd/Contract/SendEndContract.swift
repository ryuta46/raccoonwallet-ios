//
//  SendEndContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol SendEndView: BaseView {
    var presenter: SendEndPresentation! { get set }
}

//sourcery: AutoMockable
protocol SendEndPresentation: BasePresentation {
    var view: SendEndView? { get set }
    var interactor: SendEndUseCase! { get set }
    var router: SendEndWireframe! { get set }

    func didClickHome()
    func didClickTransaction()
}

//sourcery: AutoMockable
protocol SendEndUseCase: class {
    var output: SendEndInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol SendEndInteractorOutput: class {
}

//sourcery: AutoMockable
protocol SendEndWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func goBackHome()
    func presentTransaction()
}
