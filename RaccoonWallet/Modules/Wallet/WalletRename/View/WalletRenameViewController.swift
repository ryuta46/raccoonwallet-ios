//
//  WalletRenameViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletRenameViewController: BaseViewController {
    var presenter: WalletRenamePresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var navigation: UINavigationBar!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var ok: UIBarButtonItem!

    override func setup() {
        super.setup()
        navigation.topItem?.title = R.string.localizable.wallet_rename_title()

        ok.customView = createBarButton(image: R.image.icon_check_green()!, size: Constant.barIconSize, action: #selector(onTouchedOk(_:)))
        cancel.customView = createBarButton(image: R.image.icon_close()!, size: Constant.barIconSize, action: #selector(onTouchedCancel(_:)))

        name.becomeFirstResponder()
    }

    @IBAction func onChangedName(_ sender: Any) {
        if let text = name.text {
            presenter.didChangeName(text)
        }
    }

    @objc func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }

    @objc func onTouchedCancel(_ sender: Any) {
        presenter.didClickCancel()
    }
}

extension WalletRenameViewController : WalletRenameView {
    func enableOk() {
        ok.isEnabled = true
    }

    func disableOk() {
        ok.isEnabled = false
    }
}
