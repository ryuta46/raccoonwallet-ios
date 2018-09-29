//
//  WalletCreationTypeViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletCreationTypeViewController: BaseViewController {
    var presenter: WalletCreationTypePresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var newCard: CardView!
    @IBOutlet weak var loginCard: CardView!
    override func setup() {
        super.setup()
        title = R.string.localizable.wallet_select()
        
        // Do not display ripple effect
        newCard.isInteractable = false
        loginCard.isInteractable = false
    }

    @IBAction func onTouchedNewButton(_ sender: Any) {
        presenter.didClickNew()
    }

    @IBAction func onTouchedImportButton(_ sender: Any) {
        presenter.didClickImport()
    }
}

extension WalletCreationTypeViewController: WalletCreationTypeView {
}
