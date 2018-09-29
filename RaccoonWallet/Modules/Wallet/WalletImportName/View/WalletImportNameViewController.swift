//
//  WalletImportNameViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletImportNameViewController: BaseViewController {
    var presenter: WalletImportNamePresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var ok: PrimaryButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func setup() {
        super.setup()
        title = R.string.localizable.wallet_login_name_title()
        navigationItem.hidesBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        message.text = R.string.localizable.wallet_login_name_message()
        name.placeholder = "Wallet name"
    }

    override func keyboardWillShow(keyboardFrame: CGRect, duration: TimeInterval) {
        let convertedKeyboardFrame = scrollView.convert(keyboardFrame, from: nil)
        let offsetY: CGFloat = ok.frame.maxY - convertedKeyboardFrame.minY
        if offsetY < 0 { return }

        scrollView.setOffsetY(offsetY, duration: duration)
    }

    override func keyboardWillHide() {
        scrollView.clearOffset()
    }

    @IBAction func onChangedName(_ sender: Any) {
        if let text = name.text {
            presenter.didInputName(text)
        }
    }
    @IBAction func onEndedName(_ sender: Any) {
        name.resignFirstResponder()
    }
    
    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension WalletImportNameViewController : WalletImportNameView {
    func enableOk() {
        ok.isEnabled = true
    }

    func disableOk() {
        ok.isEnabled = false
    }
}
