//
//  WalletAddressPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletAddressPresenter : BasePresenter {
    weak var view: WalletAddressView?
    var interactor: WalletAddressUseCase!
    var router: WalletAddressWireframe!
    var wallet: Wallet!

    override func viewDidLoad() {
        view?.showWallet(wallet)

        if let addressQr = InvoiceQr.fromAddress(address: wallet.address).toJson() {
            view?.showQr(addressQr)
        }
    }
}

extension WalletAddressPresenter : WalletAddressPresentation {
}

extension WalletAddressPresenter : WalletAddressInteractorOutput {
    
}
