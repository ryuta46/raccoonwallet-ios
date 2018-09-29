//
//  WalletSettingContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift

protocol WalletSettingView: BaseView, PinDialogMixinView {
    var presenter: WalletSettingPresentation! { get set }

    func showWalletName(_ wallet: Wallet)
    func showLoading()
    func showWalletType(_ walletType: String)

    func showRenameDialog()
}

protocol WalletSettingPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: WalletSettingView? { get set }
    var interactor: WalletSettingUseCase! { get set }
    var router: WalletSettingWireframe! { get set }
    
    func didClickDetail()
    func didClickAddress()
    func didClickBackup()
    func didClickRename()
    func didClickDelete()

    func didChangeName(_ newName: String)
}

protocol WalletSettingUseCase: class {
    var output: WalletSettingInteractorOutput! { get set }

    func fetchAccount(_ address: String)
}

protocol WalletSettingInteractorOutput: NemServiceAccountOutput {
}

protocol WalletSettingWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ wallet: Wallet) -> UIViewController

    func presentDetail(_ wallet: Wallet)
    func presentAddress(_ wallet: Wallet)
    func presentBackup(_ wallet: Wallet)
    func presentDelete(_ wallet: Wallet)
}
