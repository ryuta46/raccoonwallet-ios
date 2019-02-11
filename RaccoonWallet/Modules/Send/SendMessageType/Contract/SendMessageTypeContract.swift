//
//  SendMessageTypeContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol SendMessageTypeView: BaseView {
    var presenter: SendMessageTypePresentation! { get set }

    func showMessageInputDialog()
}

//sourcery: AutoMockable
protocol SendMessageTypePresentation: BasePresentation {
    var view: SendMessageTypeView? { get set }
    var interactor: SendMessageTypeUseCase! { get set }
    var router: SendMessageTypeWireframe! { get set }

    func didSelectPage(_ index: Int)
    func didClickOk()
    func didConfirmMessage(_ message: String)
}

//sourcery: AutoMockable
protocol SendMessageTypeUseCase: class {
    var output: SendMessageTypeInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol SendMessageTypeInteractorOutput: class {
}

//sourcery: AutoMockable
protocol SendMessageTypeWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController

    func presentSendConfirmation(_ sendTransaction: SendTransaction)
}
