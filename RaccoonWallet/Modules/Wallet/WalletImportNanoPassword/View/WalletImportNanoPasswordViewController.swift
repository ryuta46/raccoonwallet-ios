//
//  Wallet?ImportNanoPasswordViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletImportNanoPasswordViewController: BaseViewController {
    @IBOutlet weak var ok: UIBarButtonItem!
    @IBOutlet weak var navigation: UINavigationBar!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    var presenter: WalletImportNanoPasswordPresentation! { didSet { basePresenter = presenter } }

    override func setup() {
        super.setup()

        navigation.topItem?.title = R.string.localizable.wallet_import_nano_password_title()

        headline.text = R.string.localizable.wallet_import_nano_password_headline()
        message.text = R.string.localizable.wallet_import_nano_password_message()
        password.placeholder = R.string.localizable.wallet_import_nano_password_hint()

        ok.customView = createBarButton(image: R.image.icon_check_green()!, size: Constant.barIconSize, action: #selector(onTouchedOk(_:)))
        cancel.customView = createBarButton(image: R.image.icon_close()!, size: Constant.barIconSize, action: #selector(onTouchedCancel(_:)))
    }

    @IBAction func onChangedPassword(_ sender: Any) {
        if let text = password.text {
            presenter.didChangePassword(text)
        }
    }
    
    @IBAction func onEndedPassword(_ sender: Any) {
        password.resignFirstResponder()
    }

    @objc func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }

    @objc func onTouchedCancel(_ sender: Any) {
        presenter.didClickCancel()
    }
}

extension WalletImportNanoPasswordViewController : WalletImportNanoPasswordView {
    func enableOk() {
        ok.isEnabled = true
    }

    func disableOk() {
        ok.isEnabled = false
    }
}
