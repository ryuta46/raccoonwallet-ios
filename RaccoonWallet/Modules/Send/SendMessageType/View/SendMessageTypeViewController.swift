//
//  SendMessageTypeViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents

class SendMessageTypeViewController: BaseViewController {
    var presenter: SendMessageTypePresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var standardContents: UIStackView!
    @IBOutlet weak var standardIconContainer: UIView!
    @IBOutlet weak var standardHeadline: UILabel!
    @IBOutlet weak var standardMessage: UILabel!
    @IBOutlet weak var encryptionContents: UIStackView!
    @IBOutlet weak var encryptionIconContainer: UIView!
    @IBOutlet weak var encryptionHeadline: UILabel!
    @IBOutlet weak var encryptionMessage: UILabel!

    private var standardInc: MDCInkTouchController!
    private var encryptionInc: MDCInkTouchController!
    override func setup() {
        super.setup()
        
        title = R.string.localizable.send_message_type_select_title()
        hideBackTitle()

        // ripple effect on touched
        standardInc = MDCInkTouchController(view: standardContents)
        standardInc.addInkView()

        standardHeadline.text = R.string.localizable.send_message_standard_title()
        standardHeadline.textColor = Theme.primary
        standardMessage.text = R.string.localizable.send_message_standard_message()
        standardContents.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedStandard(_:))))

        standardIconContainer.layer.borderColor = Theme.primary.cgColor
        standardIconContainer.layer.borderWidth = Constant.outlineWidth
        standardIconContainer.layer.cornerRadius = Constant.outlineRadius

        // ripple effect on touched
        encryptionInc = MDCInkTouchController(view: encryptionContents)
        encryptionInc.addInkView()

        encryptionHeadline.text = R.string.localizable.send_message_encryption_title()
        encryptionHeadline.textColor = Theme.primary
        encryptionMessage.text = R.string.localizable.send_message_encryption_message()
        encryptionContents.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedEncryption(_:))))

        encryptionIconContainer.layer.borderColor = Theme.primary.cgColor
        encryptionIconContainer.layer.borderWidth = Constant.outlineWidth
        encryptionIconContainer.layer.cornerRadius = Constant.outlineRadius
    }

    @objc func onTouchedStandard(_ sender: Any) {
        presenter.didClickStandard()
    }

    @objc func onTouchedEncryption(_ sender: Any) {
        presenter.didClickEncryption()
    }

}

extension SendMessageTypeViewController: SendMessageTypeView {
    func showMessageInputDialog() {
        let dialog = SendMessageRouter.assembleModule { [weak self] message in
            if let message = message {
                self?.presenter.didConfirmMessage(message)
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}
