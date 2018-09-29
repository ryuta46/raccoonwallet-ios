//
//  WalletNewCompletedViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletNewCompletedViewController: BaseViewController {
    var presenter: WalletNewCompletedPresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var message0: UILabel!
    @IBOutlet weak var addressHeadline: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var message1: UILabel!

    override func setup() {
        super.setup()
        hideBackButton()
        addressHeadline.textColor = Theme.primary
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension WalletNewCompletedViewController: PinDialogMixinViewController {
}

extension WalletNewCompletedViewController: WalletNewCompletedView {
    func showAddress(address: String) {
        // Title, message and address appear only after address creation has succeeded.
        self.title = R.string.localizable.wallet_create_title()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.message0.text = R.string.localizable.wallet_create_message_0()
        self.message1.text = R.string.localizable.wallet_create_message_1()

        self.addressHeadline.text = "Your Address"
        self.address.text = address.prettyAddress()
    }
}
