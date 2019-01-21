//
//  BalanceDetailViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/09.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift
import NVActivityIndicatorView

class BalanceDetailViewController: BaseViewController {
    var presenter: BalanceDetailPresentation! { didSet {basePresenter = presenter} }

    @IBOutlet weak var balanceCard: BalanceCard!
    @IBOutlet weak var mosaicListHeadline: UILabel!
    @IBOutlet weak var mosaicList: UITableView!
    @IBOutlet weak var mosaicListHeight: NSLayoutConstraint!
    
    var loadingView: FullScreenLoadingView!
    var mosaics: [MosaicDetail] = []
    override func setup() {
        super.setup()

        title = R.string.localizable.common_wallet_balance()
        hideBackTitle()

        mosaicListHeadline.text = R.string.localizable.common_mosaic_list()

        mosaicList.dataSource = self
        mosaicList.delegate = self

        loadingView = createFullScreenLoadingView()
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        mosaicListHeight.constant = mosaicList.contentSize.height
    }
}

extension BalanceDetailViewController: BalanceDetailView {
    func showBalanceLoading() {
        balanceCard.clearXem()
        balanceCard.clearLocalCurrency()
        loadingView.startLoading()
    }

    func showBalance(_ xem: Decimal) {
        balanceCard.setXem(xem)
        loadingView.stopLoading()
    }

    func showMosaicListLoading() {
    }

    func showMosaics(_ mosaics: [MosaicDetail]) {
        self.mosaics = mosaics
        mosaicList.reloadData()
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
}

extension BalanceDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
}
extension BalanceDetailViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mosaics.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mosaicList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.balanceDetailMosaicCell, for: indexPath)!

        let mosaic = mosaics[indexPath.row]

        cell.textLabel?.text = mosaic.identifier
        cell.detailTextLabel?.text = mosaic.amount.description

        return cell
    }
}
