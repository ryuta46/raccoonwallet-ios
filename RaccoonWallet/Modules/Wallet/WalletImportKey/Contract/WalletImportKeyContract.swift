//
//  WalletImportKeyContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletImportKeyView: BaseView, PinDialogMixinView {
    var presenter: WalletImportKeyPresentation! { get set }

    func enableOk()
    func disableOk()

    func showScanner()
    func showNanoWalletPassword()
}

protocol WalletImportKeyPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: WalletImportKeyView? { get set }
    var interactor: WalletImportKeyUseCase! { get set }
    var router: WalletImportKeyWireframe! { get set }

    func didInputKey(_ key: String)
    func didClickOk()
    func didClickScan()
    func didClickPrivacyPolicy()

    func didScanWallet(_ walletQr: WalletQr)
    func didCatchError(_ message: String)
    func didInputNanoWalletPassword( _ nanoWalletPassword: String)
}

protocol WalletImportKeyUseCase: class {
    var output: WalletImportKeyInteractorOutput! { get set }

    func repairWallet(key: String, pin: String)
    func repairWalletQr(from qr: WalletQr, password: String, pin: String)
}

protocol WalletImportKeyInteractorOutput: class {
    func walletRepaired(wallet: Wallet)
    func walletRepairFailed()

    func walletQrRepaired(wallet: Wallet)
    func walletQrRepairFailed()
}

protocol WalletImportKeyWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentWalletImportName()
    func presentWalletImportEnd()

    func presentPrivacyPolicy()
}
