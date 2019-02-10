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

    @IBOutlet weak var attach: PrimaryRoundedButton!
    @IBOutlet weak var notAttach: PrimaryGhostButton!
    override func setup() {
        super.setup()
        
        title = R.string.localizable.send_mode_select_title()
        hideBackTitle()
        headline.text = R.string.localizable.send_mode_select_message()
        
        attach.setTitle(R.string.localizable.send_mode_attach(), for: .normal)
        notAttach.setTitle(R.string.localizable.send_mode_not_attach(), for: .normal)
    }

    @IBAction func onTouchedAttach(_ sender: Any) {
        presenter.didClickAttach()
    }
    @IBAction func onTouchedNotAttach(_ sender: Any) {
        presenter.didClickNotAttach()
    }
}

extension SendModeViewController: SendModeView {
}
