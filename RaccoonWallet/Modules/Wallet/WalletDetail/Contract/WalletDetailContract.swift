//
//  WalletDetailContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift


protocol WalletDetailView: BaseView {
    var presenter: WalletDetailPresentation! { get set }

    func showWalletName(_ wallet: Wallet)
    func showLoading()
    func showDetail(
            type: String,
            structure: String,
            importance: String,
            publicKey: String
    )
}

protocol WalletDetailPresentation: BasePresentation {
    var view: WalletDetailView? { get set }
    var interactor: WalletDetailUseCase! { get set }
    var router: WalletDetailWireframe! { get set }
    
    func viewDidLoad()
}

protocol WalletDetailUseCase: class {
    var output: WalletDetailInteractorOutput! { get set }

    func fetchAccount(_ address: String)
}

protocol WalletDetailInteractorOutput: NemServiceAccountOutput {
}

protocol WalletDetailWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ wallet: Wallet) -> UIViewController
}
