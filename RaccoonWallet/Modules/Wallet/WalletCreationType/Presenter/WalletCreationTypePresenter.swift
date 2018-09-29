//
//  WalletCreationTypePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletCreationTypePresenter: BasePresenter {
    weak var view: WalletCreationTypeView?
    var interactor: WalletCreationTypeUseCase!
    var router: WalletCreationTypeWireframe!
}

extension WalletCreationTypePresenter: WalletCreationTypePresentation {
    func didClickNew() {
        router.presentCreationNew()
    }

    func didClickImport() {
        router.presentCreationImport()
    }
}

extension WalletCreationTypePresenter: WalletCreationTypeInteractorOutput {

}
