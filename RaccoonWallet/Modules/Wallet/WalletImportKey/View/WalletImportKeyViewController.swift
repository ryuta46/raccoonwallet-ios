//
//  WalletImportKeyViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletImportKeyViewController: BaseViewController {
    var presenter: WalletImportKeyPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var key: UITextField!
    @IBOutlet weak var ok: PrimaryButton!
    @IBOutlet weak var privacyMessage: UILabel!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!

    override func setup() {
        super.setup()
        title = R.string.localizable.wallet_import_title()
        hideBackTitle()

        message.text = R.string.localizable.wallet_import_message()
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

    @IBAction func onEndedKey(_ sender: Any) {
        key.resignFirstResponder()
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
    @IBAction func onTouchedPrivacy(_ sender: Any) {
        presenter.didClickPrivacyPolicy()
    }
    @IBAction func onChangedKey(_ sender: Any) {
        if let key = key.text {
            presenter.didInputKey(key)
        }
    }

    @IBAction func onTouchedScan(_ sender: Any) {
        presenter.didClickScan()
    }
}
extension WalletImportKeyViewController: PinDialogMixinViewController {
}

extension WalletImportKeyViewController : WalletImportKeyView {
    func enableOk() {
        ok.isEnabled = true
    }

    func disableOk() {
        ok.isEnabled = false
    }

    func showScanner() {
        let dialog = QrScannerDialogRouter.assembleModule(
                onWallet: { walletQr in
                    self.presenter.didScanWallet(walletQr)
                },
                onError: { message in
                    self.presenter.didCatchError(message)
                }
        )
        navigationController?.present(dialog, animated: true)
    }

    func showNanoWalletPassword() {
        let dialog = WalletImportNanoPasswordRouter.assembleModule { password in
            if let password = password {
                self.presenter.didInputNanoWalletPassword(password)
            }
        }
        navigationController?.present(dialog, animated: false)
    }
}
