//
//  WalletNewNamePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletNewNamePresenter: BasePresenter {
    weak var view: WalletNewNameView?
    var interactor: WalletNewNameUseCase!
    var router: WalletNewNameWireframe!

    var name: String = ""

    override func viewDidLoad() {
        view?.disableOk()
    }
}

extension WalletNewNamePresenter: WalletNewNamePresentation {
    func didInputName(_ name: String) {
        self.name = name
        if name.isEmpty {
            view?.disableOk()
        } else {
            view?.enableOk()
        }
    }

    func didClickOk() {
        router.presentWalletNewCompleted(name)
    }

    func didClickPrivacyPolicy() {
        router.presentPrivacyPolicy()
    }

}

extension WalletNewNamePresenter: WalletNewNameInteractorOutput {

}
