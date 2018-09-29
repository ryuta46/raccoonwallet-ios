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

    override func viewWillAppear() {
        super.viewWillAppear()
        if let wallet = WalletHelper.activeWallet {
            view?.showBalanceLoading()
            view?.showMosaicListLoading()
            interactor.fetchMosaicOwned(wallet.address)
        } else{
            view?.showBalance("-")
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
                view?.showBalance(mosaic.amount.description)
                break
            }
        }
        view?.showMosaics(mosaics)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        view?.showBalance("-")
        view?.showMosaics([])
        view?.showError(R.string.localizable.common_error_network())
    }
}
