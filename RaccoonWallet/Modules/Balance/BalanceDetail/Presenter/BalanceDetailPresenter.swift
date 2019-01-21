//
//  BalanceDetailPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/09.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class BalanceDetailPresenter: BasePresenter {
    weak var view: BalanceDetailView?
    var interactor: BalanceDetailUseCase!
    var router: BalanceDetailWireframe!

    var xem: Decimal?
    var rate: Decimal?

    override func viewWillAppear() {
        super.viewWillAppear()
        if let wallet = WalletHelper.activeWallet {
            view?.showBalanceLoading()
            view?.showMosaicListLoading()
            interactor.fetchMosaicOwned(wallet.address)
            interactor.fetchRate(.jpy)
        } else{
            view?.showBalanceError()
            view?.showMosaics([])
            view?.showError(R.string.localizable.wallet_not_select_message())
        }
    }
}

extension BalanceDetailPresenter: BalanceDetailPresentation {
}

extension BalanceDetailPresenter: BalanceDetailInteractorOutput {
    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        for mosaic in mosaics {
            if mosaic.isXem() {
                let xem = mosaic.amount
                view?.showBalance(xem)
                self.xem = xem
                showLocalCurrency()
                break
            }
        }
        view?.showMosaics(mosaics)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        view?.showBalanceError()
        view?.showMosaics([])
        view?.showError(R.string.localizable.common_error_network())
    }

    func rateFetched(_ rate: Decimal) {
        self.rate = rate
        showLocalCurrency()
    }

    func rateFetchFailed(_ error: Error) {
        view?.showBalanceError()
        view?.showError(R.string.localizable.common_error_network())
    }

    private func showLocalCurrency() {
        if let xem = self.xem, let rate = self.rate {
            view?.showLocalCurrency(xem * rate, .jpy) // Localize
        }
    }

}
