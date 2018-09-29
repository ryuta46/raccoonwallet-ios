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
    
    @IBOutlet weak var xem: UILabel!

    @IBOutlet weak var xemContents: UIStackView!
    @IBOutlet weak var mosaicListHeadline: UILabel!
    @IBOutlet weak var mosaicList: UITableView!
    @IBOutlet weak var mosaicListHeight: NSLayoutConstraint!

    var loadingView: FullScreenLoadingView!
    //var xemLoading: LoadingView!
    //var mosaicListLoading: LoadingView!
    var mosaics: [MosaicDetail] = []
    override func setup() {
        super.setup()

        title = R.string.localizable.common_wallet_balance()
        hideBackTitle()

        mosaicListHeadline.text = R.string.localizable.common_mosaic_list()

        mosaicList.dataSource = self
        mosaicList.delegate = self

        //xemLoading = LoadingView(target: xemContents)
        //mosaicListLoading = LoadingView(target: mosaicList)
        loadingView = createFullScreenLoadingView()
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        mosaicListHeight.constant = mosaicList.contentSize.height
    }
}

extension BalanceDetailViewController: BalanceDetailView {
    func showBalanceLoading() {
        xem.text = "-"
        loadingView.startLoading()
        //xemLoading.startLoading()
    }

    func showBalance(_ xem: String) {
        self.xem.text = xem
        loadingView.stopLoading()
        //xemLoading.stopLoading()
    }

    func showMosaicListLoading() {
        //mosaicListLoading.startLoading()
    }

    func showMosaics(_ mosaics: [MosaicDetail]) {
        self.mosaics = mosaics
        //mosaicListLoading.stopLoading()
        mosaicList.reloadData()
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
