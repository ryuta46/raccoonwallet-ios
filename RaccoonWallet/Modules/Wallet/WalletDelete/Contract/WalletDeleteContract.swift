//
//  WalletDeleteContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletDeleteView: BaseView {
    var presenter: WalletDeletePresentation! { get set }

    func showWallet(_ wallet: Wallet)
}

protocol WalletDeletePresentation: BasePresentation {
    var view: WalletDeleteView? { get set }
    var interactor: WalletDeleteUseCase! { get set }
    var router: WalletDeleteWireframe! { get set }
    
    func didClickRemove()
    func didClickCancel()
}

protocol WalletDeleteUseCase: class {
    var output: WalletDeleteInteractorOutput! { get set }
}

protocol WalletDeleteInteractorOutput: class {
}

protocol WalletDeleteWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ wallet: Wallet) -> UIViewController

    func goBack()
    func goBackToWalletSelect()
}
