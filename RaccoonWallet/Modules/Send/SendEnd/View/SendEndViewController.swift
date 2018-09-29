//
//  SendEndViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class SendEndViewController: BaseViewController {
    var presenter: SendEndPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var message: UILabel!
    override func setup() {
        super.setup()
        
        title = R.string.localizable.send_complete_title()
        hideBackTitle()
        hideBackButton()
        
        message.text = R.string.localizable.send_complete_message()
        message.textColor = Theme.primary
    }
    @IBAction func onTouchedHome(_ sender: Any) {
        presenter.didClickHome()
    }
    @IBAction func onTouchedTransaction(_ sender: Any) {
        presenter.didClickTransaction()
    }
}

extension SendEndViewController: SendEndView {
}
