//
//  SendModeViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class SendModeViewController: BaseViewController {
    var presenter: SendModePresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var standardCard: CardView!
    @IBOutlet weak var standardHeadline: UILabel!
    @IBOutlet weak var standardHint: UILabel!
    @IBOutlet weak var standardMessage: UILabel!
    @IBOutlet weak var standardImageBackground: UIView!
    @IBOutlet weak var messageCard: CardView!
    @IBOutlet weak var messageHeadline: UILabel!
    @IBOutlet weak var messageHint: UILabel!
    @IBOutlet weak var messageMessage: UILabel!
    @IBOutlet weak var messageImageBackground: UIView!

    override func setup() {
        super.setup()
        
        title = R.string.localizable.send_mode_select_title()
        hideBackTitle()
        headline.text = R.string.localizable.send_mode_select_message()

        standardHeadline.text = "STANDARD SEND"
        standardHeadline.textColor = Theme.primary
        standardHint.text = R.string.localizable.send_standard_hint()
        standardHint.textColor = Theme.secondary
        standardMessage.text = R.string.localizable.send_standard_message()
        standardImageBackground.backgroundColor = Theme.primary
        standardCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedStandardCard(_:))))

        messageHeadline.text = "Message SEND"
        messageHeadline.textColor = Theme.primary
        messageHint.text = R.string.localizable.send_message_hint()
        messageHint.textColor = Theme.secondary
        messageMessage.text = R.string.localizable.send_message_message()
        messageImageBackground.backgroundColor = Theme.primary
        messageCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedMessageCard(_:))))
    }

    @objc func onTouchedStandardCard(_ sender: Any) {
        presenter.didClickStandard()
    }

    @objc func onTouchedMessageCard(_ sender: Any) {
        presenter.didClickMessage()
    }
}

extension SendModeViewController: SendModeView {
}
