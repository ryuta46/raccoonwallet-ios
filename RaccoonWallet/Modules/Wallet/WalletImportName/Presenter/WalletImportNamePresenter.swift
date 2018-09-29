//
//  WalletImportNamePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletImportNamePresenter : BasePresenter {
    weak var view: WalletImportNameView?
    var interactor: WalletImportNameUseCase!
    var router: WalletImportNameWireframe!
    var name: String = ""

    override func viewDidLoad() {
        view?.disableOk()
    }
}

extension WalletImportNamePresenter : WalletImportNamePresentation {
    func didInputName(_ name: String) {
        self.name = name
        if name.isEmpty {
            view?.disableOk()
        } else {
            view?.enableOk()
        }
    }

    func didClickOk() {
        if let wallet = WalletHelper.activeWallet {
            wallet.name = name
            WalletStorage.shared.update(wallet)

            router.presentImportEnd()
        }
    }
}

extension WalletImportNamePresenter : WalletImportNameInteractorOutput {
    
}
