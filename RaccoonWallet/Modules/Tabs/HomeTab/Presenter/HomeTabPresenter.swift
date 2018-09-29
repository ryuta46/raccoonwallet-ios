//
//  HomeTabPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift


class HomeTabPresenter: BasePresenter {
    weak var view: HomeTabView?
    var interactor: HomeTabUseCase!
    var router: HomeTabWireframe!
    var address: String!

    var xem: Decimal?
    var rate: Decimal?
    
    var balanceLoading: Bool = false
    var transactionLoading: Bool = false
    var harvestLoading: Bool = false

    override func viewDidLoad() {
        address = WalletHelper.activeWallet?.address ?? ""
        refresh()
    }
    
    override func viewWillAppear() {
        let address = WalletHelper.activeWallet?.address ?? ""
        if self.address != address {
            self.address = address
            refresh()
        }
    }

    private func refresh() {
        view?.showLoading()
        
        balanceLoading = true
        transactionLoading = true
        harvestLoading = true
        
        xem = nil
        rate = nil
        
        interactor.fetchBalance(address)
        interactor.fetchTransferTransactionDetail(address)
        interactor.fetchHarvest(address)
        interactor.fetchRate(.jpy)
    }
    private func endLoadingIfAllDone() {
        if !balanceLoading && !transactionLoading && !harvestLoading {
            view?.hideLoading()
        }
    }
}

extension HomeTabPresenter: HomeTabPresentation {
    func didRefresh() {
        refresh()
    }
    func didClickBalance() {
        router.presentBalance()
    }

    func didClickTransaction() {
        router.presentTransaction()
    }

    func didClickHarvest() {
        router.presentHarvest()
    }
}

extension HomeTabPresenter: HomeTabInteractorOutput {
    func balanceFetched(_ microXem: UInt64) {
        let xem = MosaicDetail.xem(microXem).amount
        self.xem = xem

        view?.showBalance(xem)
        showLocalCurrency()
    }

    func balanceFetchFailed(_ error: Error) {
        balanceLoading = false
        view?.showBalanceError()
    }

    func transferTransactionDetailFetched(_ transactions: [TransferTransactionDetail]) {
        transactionLoading = false
        
        if transactions.isEmpty {
            view?.showTransactionEmpty()
        } else {
            view?.showTransaction(transactions)
        }

        endLoadingIfAllDone()
    }

    func transferTransactionDetailFetchFailed(_ error: Error) {
        transactionLoading = false
        view?.showTransactionError()
        
        endLoadingIfAllDone()
    }

    func harvestFetched(_ harvests: [Harvest]) {
        harvestLoading = false
        if harvests.isEmpty {
            view?.showHarvestEmpty()
        } else {
            view?.showHarvest(harvests)
        }

        endLoadingIfAllDone()
    }

    func harvestFetchFailed(_ error: Error) {
        harvestLoading = false
        view?.showHarvestError()

        endLoadingIfAllDone()
    }

    func rateFetched(_ rate: Decimal) {
        self.rate = rate
        showLocalCurrency()
    }

    func rateFetchFailed(_ error: Error) {
        balanceLoading = false
        endLoadingIfAllDone()
    }

    private func showLocalCurrency() {
        if let xem = self.xem, let rate = self.rate {
            view?.showLocalCurrency(xem * rate, .jpy) // Localize
            
            balanceLoading = false
            endLoadingIfAllDone()
        }
    }

}
