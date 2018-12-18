//
//  TransactionListPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class TransactionListPresenter: BasePresenter {
    weak var view: TransactionListView?
    var interactor: TransactionListUseCase!
    var router: TransactionListWireframe!
    private var transactions: [TransferTransactionDetail] = []
    private var lastId: Int? = nil
    private var isLoading = false
    private var noNext = false

    private var currentAddress: String = ""

    override func viewWillAppear() {
        super.viewWillAppear()

        if let wallet = WalletHelper.activeWallet {
            if wallet.address == currentAddress {
                // skip if same address
                return
            }
            currentAddress = wallet.address
        } else{
            view?.showError(R.string.localizable.wallet_not_select_message())
            return
        }

        view?.showTransactions([])
        loadFirst()
    }
}

extension TransactionListPresenter: TransactionListPresentation {
    func didRefresh() {
        loadFirst()
    }

    func didReachLastRow() {
        if noNext {
            return
        }
        loadNext()
    }


    func didClickTransaction(_ transaction: TransferTransactionDetail) {
        router.presentTransactionDetail(transaction)
    }

    private func loadFirst() {
        if isLoading {
            return
        }
        isLoading = true

        lastId = nil
        noNext = false

        transactions = []
        view?.showTransactions([])
        view?.showLoadingTop()
        if let wallet = WalletHelper.activeWallet {
            currentAddress = wallet.address
            interactor.fetchTransferTransactionDetail(wallet.address, withUnconfirmed: true, id: lastId)
        } else{
            view?.showError(R.string.localizable.wallet_not_select_message())
        }
    }

    private func loadNext() {
        if isLoading {
            return
        }
        isLoading = true
        view?.showLoadingBottom()
        if let wallet = WalletHelper.activeWallet {
            interactor.fetchTransferTransactionDetail(wallet.address, withUnconfirmed: false, id: lastId)
        } else{
            view?.showError(R.string.localizable.wallet_not_select_message())
        }

    }
}

extension TransactionListPresenter: TransactionListInteractorOutput {
    func transferTransactionDetailFetched(_ transactions: [TransferTransactionDetail]) {
        self.transactions += transactions
        
        let confirmedTransactions = transactions.filter { !$0.isUnconfirmed }

        if confirmedTransactions.isEmpty {
            noNext = true
        } else {
            lastId = confirmedTransactions.last?.id
        }

        if self.transactions.isEmpty {
            view?.showEmpty()
            view?.hideLoading()
        } else {
            var dateSeparatedTransactions:[[TransferTransactionDetail]] = []
            var lastDate = ""
            for transaction in self.transactions {
                if lastDate != transaction.dateString {
                    dateSeparatedTransactions.append([transaction])
                    lastDate = transaction.dateString
                } else {
                    dateSeparatedTransactions[dateSeparatedTransactions.count - 1].append(transaction)
                }
            }
            view?.showTransactions(dateSeparatedTransactions)
            view?.hideLoading()
        }
        isLoading = false
    }

    func transferTransactionDetailFetchFailed(_ error: Error) {
        if transactions.isEmpty {
            // if loading first data is failed, no more load next data
            noNext = true
        }
        isLoading = false
        view?.hideLoading()
        view?.showError(R.string.localizable.common_error_network())
    }
}
