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
    
    @IBOutlet weak var contents: UIStackView!
    @IBOutlet weak var emptyContents: UIStackView!
    @IBOutlet weak var emptyHeadline: UILabel!
    @IBOutlet weak var emptyMessage: UILabel!
    @IBOutlet weak var transactionList: UITableView!

    @IBOutlet weak var bottomLoadingView: LoadingIndicatorView!
    
    var loadingView: FullScreenLoadingView!
    var refreshControl: UIRefreshControl!
    
    var transactions: [[TransferTransactionDetail]] = []


    private let transactionListHeaderIdentifier = "transactionListHeader"

    
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

        let nib = R.nib.transactionListHeader()
        transactionList.register(nib, forHeaderFooterViewReuseIdentifier: transactionListHeaderIdentifier)
        
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
        self.transactions = transactions
        transactionList.reloadData()
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        if maximumOffset - currentOffset <= Constant.tableLoadNextBottomThreshold {
            presenter.didReachLastRow()
        }
    }
}


extension TransactionListViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didClickTransaction(transactions[indexPath.section][indexPath.row])
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.tableHeaderHeight
    }
    
}

extension TransactionListViewController: UITableViewDataSource {
    //public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //    return transactions[section][0].dateString
    //}
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: transactionListHeaderIdentifier)
        if let v = view as? TransactionListHeader {
            v.title.text = transactions[section][0].dateString
        }
        return view
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return transactions.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions[section].count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
