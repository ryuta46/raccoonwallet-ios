//
//  WalletImportNameContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletImportNameView: BaseView {
    var presenter: WalletImportNamePresentation! { get set }

    func enableOk()
    func disableOk()
}

protocol WalletImportNamePresentation: BasePresentation {
    var view: WalletImportNameView? { get set }
    var interactor: WalletImportNameUseCase! { get set }
    var router: WalletImportNameWireframe! { get set }

    func didInputName(_ name: String)
    func didClickOk()
}

protocol WalletImportNameUseCase: class {
    var output: WalletImportNameInteractorOutput! { get set }
}

protocol WalletImportNameInteractorOutput: class {
}

protocol WalletImportNameWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentImportEnd()
}
