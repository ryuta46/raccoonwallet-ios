//
//  WalletDetailViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class WalletDetailViewController : BaseViewController {
    var presenter: WalletDetailPresentation! { didSet { basePresenter = presenter } }
    @IBOutlet weak var loading: NVActivityIndicatorView!
    @IBOutlet weak var walletBar: WalletBar!
    @IBOutlet weak var walletTypeContent: UIStackView!
    
    @IBOutlet weak var general: UILabel!
    @IBOutlet weak var walletType: UILabel!
    
    @IBOutlet weak var walletDetailTableHeight: NSLayoutConstraint!

    weak var tableViewController: WalletDetailTableViewController?

    var fullScreenLoading: FullScreenLoadingView!

    override func setup() {
        super.setup()

        title = R.string.localizable.wallet_detail_title()
        hideBackTitle()
        general.text = R.string.localizable.wallet_settings_general()

        loading.setup()
        fullScreenLoading = createFullScreenLoadingView()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == R.segue.walletDetailViewController.embedDetailTable.identifier {
            tableViewController = segue.destination as? WalletDetailTableViewController
        }
    }

}

extension WalletDetailViewController : WalletDetailView {
    func showWalletName(_ wallet: Wallet) {
        walletBar.wallet = wallet
        walletBar.hasIcon = false
    }

    func showLoading() {
        fullScreenLoading.startLoading()
        //loading.startAnimating()
        //walletTypeContent.isHidden = true
        walletType.text = "-"
    }

    func showDetail(type: String, structure: String, importance: String, publicKey: String) {
        self.walletType.text = type
        tableViewController?.walletStructure = structure
        tableViewController?.importance = importance
        tableViewController?.publicKey = publicKey

        fullScreenLoading.stopLoading()
        //loading.switchTo(view: walletTypeContent)

        tableViewController?.tableView.reloadData()
    }
}
