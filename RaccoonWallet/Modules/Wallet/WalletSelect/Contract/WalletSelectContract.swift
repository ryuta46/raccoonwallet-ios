//
//  WalletSelectContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol WalletSelectView: BaseView {
    var presenter: WalletSelectPresentation! { get set }

    func showActiveId(_ activeId: String?)
    func showWallets(_ wallets: [Wallet])
    func showWalletEmpty()
}

//sourcery: AutoMockable
protocol WalletSelectPresentation: BasePresentation {
    var view: WalletSelectView? { get set }
    var interactor: WalletSelectUseCase! { get set }
    var router: WalletSelectWireframe! { get set }

    func didClickCreate()
    func didSelectWallet(_ wallet: Wallet)
    func didClickSetting(_ wallet: Wallet)
}

//sourcery: AutoMockable
protocol WalletSelectUseCase: class {
    var output: WalletSelectInteractorOutput! { get set }

    func activateWallet(_ id: String)
    func fetchActiveId()
    func fetchWallets()
}

//sourcery: AutoMockable
protocol WalletSelectInteractorOutput: class {
    func activeIdFetched(_ id: String?)
    func walletsFetched(_ wallets: [Wallet])
}

//sourcery: AutoMockable
protocol WalletSelectWireframe: class {
    var viewController: UIViewController? { get set }

    func presentCreate()
    func presentSetting(for wallet: Wallet)

    static func assembleModule() -> UIViewController

}
