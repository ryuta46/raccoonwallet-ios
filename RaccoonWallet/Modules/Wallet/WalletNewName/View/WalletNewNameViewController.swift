//
//  WalletNewNameViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletNewNameViewController: BaseViewController {
    var presenter: WalletNewNamePresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var ok: PrimaryButton!
    @IBOutlet weak var privacyMessage: UILabel!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func setup() {
        super.setup()
        title = R.string.localizable.wallet_name_title()

        message.text = R.string.localizable.wallet_name_message()
        name.placeholder = R.string.localizable.wallet_name_input()
        privacyMessage.text = R.string.localizable.common_privacy_policy_caution()
        privacyButton.setTitle(R.string.localizable.common_privacy_policy(), for: .normal)
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

    @IBAction func onTouchedPrivacyPolicy(_ sender: Any) {
        presenter.didClickPrivacyPolicy()
    }
}

extension WalletNewNameViewController: WalletNewNameView {
    func enableOk() {
        ok.isEnabled = true
    }

    func disableOk() {
        ok.isEnabled = false
    }

}
