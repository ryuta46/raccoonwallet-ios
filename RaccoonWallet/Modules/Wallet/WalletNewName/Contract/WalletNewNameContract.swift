//
//  WalletNewNameContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

protocol WalletNewNameView: BaseView {
    var presenter: WalletNewNamePresentation! { get set }

    func enableOk()
    func disableOk()
}

protocol WalletNewNamePresentation: BasePresentation {
    var view: WalletNewNameView? { get set }
    var interactor: WalletNewNameUseCase! { get set }
    var router: WalletNewNameWireframe! { get set }

    func didInputName(_ name: String)
    func didClickOk()
    func didClickPrivacyPolicy()
}

protocol WalletNewNameUseCase: class {
    var output: WalletNewNameInteractorOutput! { get set }
}

protocol WalletNewNameInteractorOutput: class {
}

protocol WalletNewNameWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentWalletNewCompleted(_ name: String)
    func presentPrivacyPolicy()
}
