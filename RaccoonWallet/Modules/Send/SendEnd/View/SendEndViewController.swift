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
    
    @IBOutlet weak var homeCard: CardView!
    @IBOutlet weak var transactionCard: CardView!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var transactionLabel: UILabel!
    override func setup() {
        super.setup()

        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false

        title = R.string.localizable.send_complete_title()
        hideBackTitle()
        hideBackButton()

        homeCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedHome(_:))))
        transactionCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedTransaction(_:))))

        message.text = R.string.localizable.send_complete_message()
        transactionLabel.text = R.string.localizable.send_complete_transaction_label()

    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        super.viewWillDisappear(animated)
    }
    
    @objc func onTouchedHome(_ sender: Any) {
        presenter.didClickHome()
    }
    @objc func onTouchedTransaction(_ sender: Any) {
        presenter.didClickTransaction()
    }
}

extension SendEndViewController: SendEndView {
}
