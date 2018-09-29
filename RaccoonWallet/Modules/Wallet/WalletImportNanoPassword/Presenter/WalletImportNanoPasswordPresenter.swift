//
//  WalletImportNanoPasswordPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
class WalletImportNanoPasswordPresenter : BasePresenter {
    weak var view: WalletImportNanoPasswordView?
    var interactor: WalletImportNanoPasswordUseCase!
    var router: WalletImportNanoPasswordWireframe!

    var password: String = ""
    var handler: ((String?) -> Void)?

    override func viewDidLoad() {
        view?.disableOk()
    }
}

extension WalletImportNanoPasswordPresenter : WalletImportNanoPasswordPresentation {
    func didClickOk() {
        router.dismiss(password, handler)
    }

    func didClickCancel() {
        router.dismiss(nil, handler)
    }

    func didChangePassword(_ password: String) {
        self.password = password

        if password.count > 0 {
            view?.enableOk()
        } else {
            view?.disableOk()
        }
    }
}

extension WalletImportNanoPasswordPresenter : WalletImportNanoPasswordInteractorOutput {
    
}
