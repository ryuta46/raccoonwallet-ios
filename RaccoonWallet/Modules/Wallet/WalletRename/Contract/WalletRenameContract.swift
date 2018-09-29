//
//  WalletRenameContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletRenameView: BaseView {
    var presenter: WalletRenamePresentation! { get set }

    func enableOk()
    func disableOk()
}

protocol WalletRenamePresentation: BasePresentation {
    var view: WalletRenameView? { get set }
    var interactor: WalletRenameUseCase! { get set }
    var router: WalletRenameWireframe! { get set }
    
    func didClickOk()
    func didClickCancel()
    func didChangeName(_ name: String)
}

protocol WalletRenameUseCase: class {
    var output: WalletRenameInteractorOutput! { get set }
}

protocol WalletRenameInteractorOutput: class {
}

protocol WalletRenameWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ handler: ((String?) -> Void)?) -> UIViewController

    func dismiss(_ newName: String?, _ handler: ((String?) -> Void)?)
}
