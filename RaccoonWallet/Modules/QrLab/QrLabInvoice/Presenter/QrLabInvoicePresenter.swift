//
//  QrLabInvoicePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class QrLabInvoicePresenter: BasePresenter {
    weak var view: QrLabInvoiceView?
    var interactor: QrLabInvoiceUseCase!
    var router: QrLabInvoiceWireframe!

    var wallet: Wallet!
    var amount: Decimal!
    var localCurrencyAmount: Decimal!
    var localCurrencyUnit: String!
    var handler: ((Bool) -> Void)?

    override func viewDidLoad() {
        view?.showAmount(amount.description)
        view?.showLocalCurrency(localCurrencyAmount.description, localCurrencyUnit)
    }

    override func viewWillAppear() {
        if let wallet = WalletHelper.activeWallet {
            if let invoiceQr = InvoiceQr.fromXemAmount(address: wallet.address, xem: amount).toJson() {
                view?.showQr(invoiceQr)
            }

            view?.showAddress(wallet.address.prettyAddress())
        } else {
            view?.showError(R.string.localizable.wallet_not_select_message())
            return
        }
    }


}

extension QrLabInvoicePresenter: QrLabInvoicePresentation {
    func didClickOk() {
        router.goBackHome()
    }
}

extension QrLabInvoicePresenter: QrLabInvoiceInteractorOutput {
    
}
