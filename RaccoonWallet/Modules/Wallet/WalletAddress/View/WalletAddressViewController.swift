//
//  WalletAddressViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import ZXingObjC

class WalletAddressViewController : BaseViewController {
    var presenter: WalletAddressPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var walletBar: WalletBar!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var addressQr: UIImageView!

    override func setup() {
        super.setup()
        title = R.string.localizable.common_address()
        addressTitle.textColor = Theme.primary
    }
}

extension WalletAddressViewController : WalletAddressView {
    func showWallet(_ wallet: Wallet) {
        walletBar.wallet = wallet
        walletBar.hasIcon = false
        address.text = wallet.address.prettyAddress()
    }

    func showQr(_ walletAddressQrJson: String) {
        addressQr.setQrText(walletAddressQrJson)
    }
}
