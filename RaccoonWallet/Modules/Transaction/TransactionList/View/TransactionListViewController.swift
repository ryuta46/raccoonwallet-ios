//
//  TransactionListViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class TransactionListViewController: BaseViewController {
    var presenter: TransactionListPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var walletBar: WalletBar!
    @IBOutlet weak var contents: UIStackView!
    @IBOutlet weak var emptyContents: UIStackView!
    @IBOutlet weak var emptyHeadline: UILabel!
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var transactionList: UITableView!

    @IBOutlet weak var bottomLoadingView: LoadingIndicatorView!
    
    var loadingView: FullScreenLoadingView!
    var refreshControl: UIRefreshControl!
    
    var walletBarOriginalFrame: CGRect? = nil

    var transactions: [[TransferTransactionDetail]] = [
        []  // dummy for hero image
    ]
    override func setup() {
        super.setup()

        title = R.string.localizable.transaction_list_title()
        hideBackTitle()
        
        emptyHeadline.text = R.string.localizable.transaction_no_transaction_title()
        emptyHeadline.textColor = Theme.secondary
        emptyMessage.text = R.string.localizable.transaction_no_transaction_message()
        emptyMessage.textColor = Theme.secondary

        transactionList.delegate = self
        transactionList.dataSource = self

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        refreshControl.bounds = refreshControl.bounds.offsetBy(dx: 0, dy: Constant.walletBarHeightOffset)
        transactionList.addSubview(refreshControl)

        loadingView = createFullScreenLoadingView()
        
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        refreshControl.endRefreshing()
        presenter.didRefresh()
    }
}

extension TransactionListViewController: TransactionListView {
    func showLoadingTop() {
        loadingView.startLoading()
    }
    func showLoadingBottom() {
        bottomLoadingView.startLoading()
    }

    func hideLoading() {
        loadingView.stopLoading()
        bottomLoadingView.stopLoading()
    }

    func showEmpty() {
        emptyContents.isHidden = false
        transactionList.isHidden = true
    }

    func showTransactions(_ transactions: [[TransferTransactionDetail]]) {
        emptyContents.isHidden = true
        transactionList.isHidden = false
        self.transactions = [[]] // for hero image
            + transactions
        transactionList.reloadData()
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if walletBarOriginalFrame == nil {
            walletBarOriginalFrame = walletBar.frame
        }
        walletBar.frame = walletBarOriginalFrame!.offsetBy(dx: 0, dy: min(-currentOffset, 0))

        if maximumOffset - currentOffset <= Constant.tableLoadNextBottomThreshold {
            presenter.didReachLastRow()
        }
    }
}


extension TransactionListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {  // for hero image
            return
        }
        presenter.didClickTransaction(transactions[indexPath.section][indexPath.row])
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0 // for hero image
        }
        return Constant.tableHeaderHeight
    }
    
}

extension TransactionListViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil // for hero image
        }
        return transactions[section][0].dateString
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return transactions.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // for hero image
        }
        return transactions[section].count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {// for hero image
            return transactionList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.transactionHeroImageCell, for: indexPath)!
        }
        
        let transaction = transactions[indexPath.section][indexPath.row]
        let cell = transactionList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.transactionListCell, for: indexPath)!

        cell.time.text = transaction.timeInDayString
        cell.messageLabel.isHidden = !transaction.hasMessage
        cell.messageCheck.isHidden = !transaction.hasMessage

        cell.mosaicLabel.isHidden = !transaction.hasMosaic
        cell.mosaicCheck.isHidden = !transaction.hasMosaic
        cell.mosaicLeftSpace.isHidden = !transaction.hasMosaic

        cell.directionImage.image = transaction.directionImage
        cell.multisigDirectionImage.image = transaction.multisigImage

        cell.amountSign.text = transaction.directionText
        cell.amountSign.textColor = transaction.directionColor
        cell.amount.text = transaction.briefAmountDescription

        cell.unconfirmedIcon.isHidden = !transaction.isUnconfirmed
        cell.confirmedIcon.isHidden = transaction.isUnconfirmed
        cell.peer.text = transaction.peer.prettyAddress()

        return cell
    }
}
