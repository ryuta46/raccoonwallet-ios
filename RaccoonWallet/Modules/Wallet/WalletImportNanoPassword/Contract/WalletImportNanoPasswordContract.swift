//
//  WalletImportNanoPasswordContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletImportNanoPasswordView: BaseView {
    var presenter: WalletImportNanoPasswordPresentation! { get set }

    func enableOk()
    func disableOk()
}

protocol WalletImportNanoPasswordPresentation: BasePresentation {
    var view: WalletImportNanoPasswordView? { get set }
    var interactor: WalletImportNanoPasswordUseCase! { get set }
    var router: WalletImportNanoPasswordWireframe! { get set }
    
    func didClickOk()
    func didClickCancel()
    func didChangePassword(_ password: String)
}

protocol WalletImportNanoPasswordUseCase: class {
    var output: WalletImportNanoPasswordInteractorOutput! { get set }
}

protocol WalletImportNanoPasswordInteractorOutput: class {
}

protocol WalletImportNanoPasswordWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ handler: ((String?) -> Void)?) -> UIViewController

    func dismiss(_ password: String?, _ handler: ((String?) -> Void)?)
}
