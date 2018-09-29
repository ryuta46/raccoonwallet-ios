//
//  SendModeContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol SendModeView: BaseView {
    var presenter: SendModePresentation! { get set }
}

//sourcery: AutoMockable
protocol SendModePresentation: BasePresentation {
    var view: SendModeView? { get set }
    var interactor: SendModeUseCase! { get set }
    var router: SendModeWireframe! { get set }

    func didClickStandard()
    func didClickMessage()
}

//sourcery: AutoMockable
protocol SendModeUseCase: class {
    var output: SendModeInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol SendModeInteractorOutput: class {
}

//sourcery: AutoMockable
protocol SendModeWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController

    func presentSendConfirmation(_ sendTransaction: SendTransaction)
    func presentSendMessageType(_ sendTransaction: SendTransaction)
}
