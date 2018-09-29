//
//  WalletDeleteViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletDeleteViewController : BaseViewController {
    var presenter: WalletDeletePresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var walletBar: WalletBar!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()
        title = R.string.localizable.common_delete()
        headline.text = R.string.localizable.wallet_key_caution_title()
        message.text = R.string.localizable.wallet_delete_caution_message()
    }

    @IBAction func onTouchedRemove(_ sender: Any) {
        presenter.didClickRemove()
    }
    @IBAction func onTouchedCancel(_ sender: Any) {
        presenter.didClickCancel()
    }
    
}

extension WalletDeleteViewController : WalletDeleteView {
    func showWallet(_ wallet: Wallet) {
        walletBar.wallet = wallet
        walletBar.hasIcon = false
    }
}
