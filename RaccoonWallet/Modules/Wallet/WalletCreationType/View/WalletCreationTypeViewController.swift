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
    @IBOutlet weak var newButton: PrimaryRoundedButton!
    @IBOutlet weak var importButton: PrimaryGhostButton!
    override func setup() {
        super.setup()
        title = R.string.localizable.wallet_select()

        view.backgroundColor = Theme.baseBackground

        newButton.setTitle(R.string.localizable.wallet_creation_type_new(), for: .normal)
        importButton.setTitle(R.string.localizable.wallet_creation_type_import(), for: .normal)
        
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
