//
//  SendMessageContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol SendMessageView: BaseView {
    var presenter: SendMessagePresentation! { get set }

    func enableOk()
    func disableOk()
    func showTitle(_ title: String)
}

//sourcery: AutoMockable
protocol SendMessagePresentation: BasePresentation {
    var view: SendMessageView? { get set }
    var interactor: SendMessageUseCase! { get set }
    var router: SendMessageWireframe! { get set }

    func didClickOk()
    func didClickCancel()
    func didChangeMessage(_ message: String)
}

//sourcery: AutoMockable
protocol SendMessageUseCase: class {
    var output: SendMessageInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol SendMessageInteractorOutput: class {
}

//sourcery: AutoMockable
protocol SendMessageWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ handler: ((String?) -> Void)?) -> UIViewController

    func dismiss(_ message: String?, _ handler: ((String?) -> Void)?)
}
