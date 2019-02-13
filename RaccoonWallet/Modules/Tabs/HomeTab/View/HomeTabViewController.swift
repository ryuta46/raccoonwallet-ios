//
//  HomeTabViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift

class HomeTabViewController: BaseViewController {
    var presenter: HomeTabPresentation! { didSet { basePresenter = presenter} }
    var transactionViews: [TransactionView]!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var balanceCard: BalanceCard!

    @IBOutlet weak var transactionHeadline: UILabel!
    @IBOutlet weak var transactionCard: CardView!
    @IBOutlet weak var transaction0: TransactionView!
    @IBOutlet weak var transaction1: TransactionView!
    @IBOutlet weak var transaction2: TransactionView!
    @IBOutlet weak var transaction3: TransactionView!
    @IBOutlet weak var transactionContent: UIStackView!
    @IBOutlet weak var transactionEmpty: UIStackView!
    @IBOutlet weak var transactionEmptyMessage: UILabel!

    @IBOutlet weak var harvestHeadline: UILabel!
    @IBOutlet weak var harvestView: HarvestView!
    @IBOutlet weak var harvestEmpty: UIStackView!
    @IBOutlet weak var harvestEmptyMessage: UILabel!

    var loadingView: FullScreenLoadingView!
    var refreshControl: UIRefreshControl!
    
    override func setup() {
        super.setup()

        view.backgroundColor = Theme.baseBackground
        transactionHeadline.text = R.string.localizable.home_transaction_headline()
        transactionEmptyMessage.text = R.string.localizable.home_transaction_empty_message()
        harvestHeadline.text = R.string.localizable.common_harvest()
        harvestEmptyMessage.text = R.string.localizable.home_harvest_empty_message()

        transactionViews = [
            transaction0, transaction1, transaction2, transaction3
        ]
        transactionViews.forEach { transactionView in
            transactionView.date.font = UIFont.monospacedDigitSystemFont(ofSize: transactionView.date.font.pointSize, weight: UIFont.Weight.light)
        }

        balanceCard.card.setOnTouchedHandler {
            self.presenter.didClickBalance()
        }

        transactionCard.setOnTouchedHandler {
            self.presenter.didClickTransaction()
        }

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        // under the wallet bar
        refreshControl.bounds = refreshControl.bounds.offsetBy(dx: 0, dy: Constant.walletBarHeightOffset)
        scrollView.addSubview(refreshControl)
        
        loadingView = createFullScreenLoadingView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = "HOME"
    }

    @objc func refresh(_ sender: UIRefreshControl) {
        refreshControl.endRefreshing()
        presenter.didRefresh()
    }
}

extension HomeTabViewController: HomeTabView {
    func showLoading() {
        balanceCard.clearXem()
        balanceCard.clearLocalCurrency()
        transactionContent.isHidden = true
        transactionEmpty.isHidden = true
        harvestEmpty.isHidden = true
        harvestView.isHidden = true
        
        loadingView.startLoading()
    }
    
    func hideLoading() {
        loadingView.stopLoading()
    }


    func showBalance(_ xem: Decimal) {
        balanceCard.xem.text = xem.description
    }

    func showBalanceError() {
        balanceCard.clearXem()
        balanceCard.clearLocalCurrency()
    }

    func showLocalCurrency(_ value: Decimal, _ unit: Currency) {
        balanceCard.setLocalCurrency(value, unit)
    }

    func showLocalCurrencyError() {
        balanceCard.clearLocalCurrency()
    }

    func showTransaction(_ transactions: [TransferTransactionDetail]) {
        for i in 0..<transactionViews.count {
            let view = transactionViews[i]
            if let transaction = transactions[safe: i] {
                view.isHidden = false

                view.date.text = transaction.dateString
                view.directionImage.image = transaction.directionImage

                if let multisigDirectionImage = transaction.multisigImage {
                    view.multisigDirectionImage.image = multisigDirectionImage
                    view.multisigDirectionImage.isHidden = false
                } else {
                    view.multisigDirectionImage.isHidden = true
                }

                view.amount.text = transaction.briefAmountDescription
            } else {
                view.isHidden = true
            }
        }

        transactionContent.isHidden = false
    }

    func showTransactionEmpty() {
        transactionEmpty.isHidden = false
    }

    func showTransactionError() {
        showTransactionEmpty()
    }

    func showHarvestEmpty() {
        harvestEmpty.isHidden = false
    }

    func showHarvest(_ harvests: [Harvest]) {
        guard let lastHarvest = harvests.first else {
            showHarvestEmpty()
            return
        }
        harvestView.date.font = UIFont.monospacedDigitSystemFont(ofSize: harvestView.date.font.pointSize, weight: UIFont.Weight.light)
        harvestView.date.text = lastHarvest.timeStamp.dateAsTimestamp().dateString
        harvestView.amount.text = MosaicDetail.xem(lastHarvest.totalFee).amountDescription

        harvestView.isHidden = false
    }

    func showHarvestError() {
        showHarvestEmpty()
    }

}
