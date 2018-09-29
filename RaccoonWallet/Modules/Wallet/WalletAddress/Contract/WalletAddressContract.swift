//
//  WalletAddressContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletAddressView: BaseView {
    var presenter: WalletAddressPresentation! { get set }

    func showWallet(_ wallet: Wallet)
    func showQr(_ walletAddressQrJson: String)
}

protocol WalletAddressPresentation: BasePresentation {
    var view: WalletAddressView? { get set }
    var interactor: WalletAddressUseCase! { get set }
    var router: WalletAddressWireframe! { get set }
}

protocol WalletAddressUseCase: class {
    var output: WalletAddressInteractorOutput! { get set }
}

protocol WalletAddressInteractorOutput: class {
}

protocol WalletAddressWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ wallet: Wallet) -> UIViewController
}
