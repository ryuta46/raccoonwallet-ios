//
//  SendMessageViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class SendMessageViewController: BaseViewController {
    var presenter: SendMessagePresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var ok: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var messageInput: UITextView!
    @IBOutlet weak var placeholder: UILabel!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    override func setup() {
        super.setup()

        navigationBar.topItem?.title = R.string.localizable.wallet_import_nano_password_title()

        placeholder.text = R.string.localizable.common_message_input()
        placeholder.textColor = UIColor.lightGray

        ok.customView = createBarButton(image: R.image.icon_check_green()!, size: Constant.barIconSize, action: #selector(onTouchedOk(_:)))
        cancel.customView = createBarButton(image: R.image.icon_close()!, size: Constant.barIconSize, action: #selector(onTouchedCancel(_:)))

        messageInput.delegate = self
    }

    override func keyboardWillShow(keyboardFrame: CGRect, duration: TimeInterval) {
        bottomConstraint.constant = keyboardFrame.height
    }

    override func keyboardWillHide() {
        bottomConstraint.constant = 0
    }


    @objc func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }

    @objc func onTouchedCancel(_ sender: Any) {
        presenter.didClickCancel()
    }

}

extension SendMessageViewController: SendMessageView {
    func enableOk() {
        ok.isEnabled = true
    }

    func disableOk() {
        ok.isEnabled = false
    }

    func showTitle(_ title: String) {
        navigationBar.topItem?.title = title
    }
}

extension SendMessageViewController: UITextViewDelegate {
    public func textViewDidChange(_ textView: UITextView) {
        placeholder.isHidden = textView.text.count > 0
        presenter.didChangeMessage(textView.text)
    }
}
