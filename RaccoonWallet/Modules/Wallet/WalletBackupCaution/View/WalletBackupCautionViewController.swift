//
//  WalletBackupCautionViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletBackupCautionViewController : BaseViewController {
    var presenter: WalletBackupCautionPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()
        title = R.string.localizable.common_backup()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        headline.text = R.string.localizable.wallet_key_caution_title()
        message.text = R.string.localizable.wallet_key_caution_message()
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension WalletBackupCautionViewController : WalletBackupCautionView {
}
