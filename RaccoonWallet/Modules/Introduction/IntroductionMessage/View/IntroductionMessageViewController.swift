//
//  IntroductionMessageViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class IntroductionMessageViewController: BaseViewController {
    var presenter: IntroductionMessagePresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var message: UILabel!
    override func setup() {
        super.setup()
        
        title = R.string.localizable.create_wallet_tutorial_title()
        message.text = R.string.localizable.create_wallet_tutorial_message()
    }
    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension IntroductionMessageViewController: IntroductionMessageView {
}
