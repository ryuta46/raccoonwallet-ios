//
//  DonationDetailViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/12.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class DonationDetailViewController: BaseViewController {
    var presenter: DonationDetailPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var card: CardView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var detail: UILabel!
    override func setup() {
        super.setup()
        
        title = R.string.localizable.donation_detail_title()
        name.textColor = Theme.primary
        role.textColor = Theme.secondary
        
        card.isInteractable = false
    }
    @IBAction func onTouchedDonate(_ sender: Any) {
        presenter.didClickDonate()
    }
}

extension DonationDetailViewController: DonationDetailView {
    func showDeveloper(_ developer: Developer) {
        icon.image = developer.icon
        name.text = developer.name
        role.text = developer.role
        detail.text = developer.detail
    }

    func showNotSetPinError() {
        let dialog = MessageDialogPreset.createErrorNotSetPin { result in
            if result == .ok {
                self.presenter.didClickGoPinSetting()
            }
        }
        navigationController?.present(dialog, animated: true)
    }

    func showNotSelectWalletError() {
        let dialog = MessageDialogPreset.createErrorNotSelectWallet { result in
            if result == .ok {
                self.presenter.didClickGoWalletSelect()
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}
