//
//  WalletBackupViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletBackupViewController : BaseViewController {
    var presenter: WalletBackupPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var privateKey: UILabel!
    @IBOutlet weak var done: PrimaryButton!

    override func setup() {
        super.setup()
        title = R.string.localizable.common_backup()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        headline.text = R.string.localizable.wallet_key_backup_title()
        message.text = R.string.localizable.wallet_key_backup_message()
        done.setTitle(R.string.localizable.common_done(), for: .normal)

        privateKey.text = ""
        privateKey.isUserInteractionEnabled = true
        privateKey.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedPrivateKey(_:))))
    }

    @IBAction func onTouchedDone(_ sender: Any) {
        presenter.didClickDone()
    }

    @objc func onTouchedPrivateKey(_ sender: Any) {
        presenter.didClickPrivateKey()
    }

}

extension WalletBackupViewController: PinDialogMixinViewController {
}

extension WalletBackupViewController : WalletBackupView {
    func showPrivateKey(_ privateKey: String) {
        self.privateKey.text = privateKey
    }
}
