//
//  WalletBackupCautionContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


enum WalletBackupOrigin {
    case walletSetting
    case lessonBeginner
    case lessonExpert

}

protocol WalletBackupCautionView: BaseView {
    var presenter: WalletBackupCautionPresentation! { get set }
}

protocol WalletBackupCautionPresentation: BasePresentation {
    var view: WalletBackupCautionView? { get set }
    var interactor: WalletBackupCautionUseCase! { get set }
    var router: WalletBackupCautionWireframe! { get set }
    
    func didClickOk()
}

protocol WalletBackupCautionUseCase: class {
    var output: WalletBackupCautionInteractorOutput! { get set }
}

protocol WalletBackupCautionInteractorOutput: class {
}

protocol WalletBackupCautionWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ wallet: Wallet, from origin: WalletBackupOrigin) -> UIViewController

    func presentWalletBackup(_ wallet: Wallet, from origin: WalletBackupOrigin)
}
