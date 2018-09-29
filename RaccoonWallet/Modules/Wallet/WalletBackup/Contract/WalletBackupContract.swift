//
//  WalletBackupContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletBackupView: BaseView, PinDialogMixinView {
    var presenter: WalletBackupPresentation! { get set }

    func showPrivateKey(_ privateKey: String)
}

protocol WalletBackupPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: WalletBackupView? { get set }
    var interactor: WalletBackupUseCase! { get set }
    var router: WalletBackupWireframe! { get set }
    
    func didClickPrivateKey()
    func didClickDone()
}

protocol WalletBackupUseCase: class {
    var output: WalletBackupInteractorOutput! { get set }

    func decryptPrivateKey(_ wallet: Wallet, pin: String)
}

protocol WalletBackupInteractorOutput: class {
    func privateKeyDecrypted(_ privateKey: String)
    func privateKeyDecryptFailed()
}

protocol WalletBackupWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ wallet: Wallet, from origin: WalletBackupOrigin) -> UIViewController

    func goBack(to origin: WalletBackupOrigin)
}
