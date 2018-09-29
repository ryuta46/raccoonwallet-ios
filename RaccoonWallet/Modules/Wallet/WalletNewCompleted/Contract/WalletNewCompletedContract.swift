//
//  WalletNewCompletedContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

protocol WalletNewCompletedView: BaseView, PinDialogMixinView {
    var presenter: WalletNewCompletedPresentation! { get set }

    func showAddress(address: String)
}

protocol WalletNewCompletedPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: WalletNewCompletedView? { get set }
    var interactor: WalletNewCompletedUseCase! { get set }
    var router: WalletNewCompletedWireframe! { get set }

    func didClickOk()
}

protocol WalletNewCompletedUseCase: class {
    var output: WalletNewCompletedInteractorOutput! { get set }

    func createWallet(name: String, pin: String)
}

protocol WalletNewCompletedInteractorOutput: class {
    func walletCreated(wallet: Wallet)
    func walletCreateFailed()
}

protocol WalletNewCompletedWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(name: String) -> UIViewController

    func goBack()
    func presentWalletNewEnd()
}
