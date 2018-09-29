//
//  WalletSelectViewCo?ntroller.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletSelectViewController: BaseViewController {
    @IBOutlet weak var walletList: UITableView!
    var presenter: WalletSelectPresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var walletListHeight: NSLayoutConstraint!
    @IBOutlet weak var walletBar: WalletBar!

    @IBOutlet weak var emptyView: UIView!

    var wallets: [Wallet] = []
    var activeId: String = ""

    override func setup() {
        super.setup()

        walletList.dataSource = self
        walletList.delegate = self

        walletBar.isOpened = true

        showWalletEmptyView(false)

        title = R.string.localizable.wallet_select()
        navigationItem.hidesBackButton = true
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        walletListHeight.constant = walletList.contentSize.height
    }

    @IBAction func onTouchedCreateWallet(_ sender: Any) {
        presenter.didClickCreate()
    }

}

extension WalletSelectViewController: WalletSelectView {
    func showActiveId(_ activeId: String?) {
        if let id = activeId {
            self.activeId = id
            walletBar.reloadWallet()
            walletList.reloadData()
        }
    }
    func showWallets(_ wallets: [Wallet]) {
        self.wallets = wallets
        //walletListHeight.constant = calculateTableHeight()
        showWalletEmptyView(false)
        walletList.reloadData()
    }

    func showWalletEmpty() {
        showWalletEmptyView(true)
    }

    private func showWalletEmptyView(_ isVisible: Bool) {
        emptyView.isHidden = !isVisible
        walletList.isHidden = isVisible
    }
}

extension WalletSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let wallet = wallets[indexPath.row]
        let cell = walletList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.walletListCell, for: indexPath)! as WalletListCell

        cell.activeIndicator.isSelected = wallet.id == activeId
        cell.walletName.text = wallet.name
        cell.setOnTouchedSetting { [weak self] in
            guard let weakSelf = self else {
                return
            }
            weakSelf.presenter.didClickSetting(weakSelf.wallets[indexPath.row])
        }

        return cell
    }

}

extension WalletSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectWallet(wallets[indexPath.row])
    }
}
