//
//  TransactionListContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol TransactionListView: BaseView {
    var presenter: TransactionListPresentation! { get set }

    func showLoadingTop()
    func showLoadingBottom()
    func hideLoading()
    func showEmpty()
    func showTransactions(_ transactions: [[TransferTransactionDetail]])
}

//sourcery: AutoMockable
protocol TransactionListPresentation: BasePresentation {
    var view: TransactionListView? { get set }
    var interactor: TransactionListUseCase! { get set }
    var router: TransactionListWireframe! { get set }

    func didRefresh()
    func didReachLastRow()
    func didClickTransaction(_ transaction: TransferTransactionDetail)
}

//sourcery: AutoMockable
protocol TransactionListUseCase: class {
    var output: TransactionListInteractorOutput! { get set }

    func fetchTransferTransactionDetail(_ address: String, withUnconfirmed: Bool, id: Int?)
}

//sourcery: AutoMockable
protocol TransactionListInteractorOutput: NemServiceTransferTransactionDetailOutput {
}

//sourcery: AutoMockable
protocol TransactionListWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentTransactionDetail(_ transaction: TransferTransactionDetail)
}
