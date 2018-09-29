//
//  QrLabTabViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class QrLabViewController : BaseViewController {
    var presenter: QrLabTabPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var amount: CardView!
    @IBOutlet weak var amountHeadline: UILabel!
    @IBOutlet weak var list: CardView!
    @IBOutlet weak var listHeadline: UILabel!
    @IBOutlet weak var register: CardView!
    @IBOutlet weak var registerHeadline: UILabel!
    @IBOutlet weak var registerDescription: UILabel!
    @IBOutlet weak var registerHint: UILabel!

    override func setup() {
        super.setup()
        amount.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedAmount(_:))))
        amountHeadline.text = R.string.localizable.qrlab_amount_headline()

        list.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedList(_:))))
        listHeadline.text = R.string.localizable.qrlab_list_headline()

        register.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedRegister(_:))))
        registerHeadline.text = R.string.localizable.qrlab_register_headline()
        registerDescription.text = R.string.localizable.qrlab_register_description()
        registerHint.text = R.string.localizable.common_coming_soon()
    }

    @objc func onTouchedAmount(_ sender: Any) {
        presenter.didClickAmount()
    }

    @objc func onTouchedList(_ sender: Any) {
        presenter.didClickList()
    }

    @objc func onTouchedRegister(_ sender: Any) {
        presenter.didClickRegister()
    }

}

extension QrLabViewController : QrLabTabView {
}
