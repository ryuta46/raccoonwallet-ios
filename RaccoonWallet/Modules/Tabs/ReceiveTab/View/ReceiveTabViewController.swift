//
//  ReceiveTabViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/01.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class ReceiveTabViewController : BaseViewController {
    var presenter: ReceiveTabPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var addressQr: UIImageView!
    @IBOutlet weak var addressTitle: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func setup() {
        super.setup()
        addressTitle.textColor = Theme.primary
    }
}

extension ReceiveTabViewController : ReceiveTabView {
    func showAddress(_ address: String) {
        self.address.text = address
    }

    func showQr(_ walletAddressQrJson: String) {
        addressQr.isHidden = false
        addressQr.setQrText(walletAddressQrJson)
    }

    func hideQr() {
        addressQr.isHidden = true
    }
}
