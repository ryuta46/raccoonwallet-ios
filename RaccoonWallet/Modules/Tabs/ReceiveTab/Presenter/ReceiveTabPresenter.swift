//
//  ReceiveTabPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/01.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class ReceiveTabPresenter: BasePresenter{
    weak var view: ReceiveTabView?
    var interactor: ReceiveTabUseCase!
    var router: ReceiveTabWireframe!

    override func viewWillAppear() {
        if let wallet = WalletHelper.activeWallet {
            view?.showAddress(wallet.address.prettyAddress())
            if let addressQr = InvoiceQr.fromAddress(address: wallet.address, name: wallet.name).toJson() {
                view?.showQr(addressQr)
            }
        } else {
            view?.hideQr()
            view?.showAddress("")
        }
    }
}

extension ReceiveTabPresenter: ReceiveTabPresentation {
}

extension ReceiveTabPresenter : ReceiveTabInteractorOutput {

}
