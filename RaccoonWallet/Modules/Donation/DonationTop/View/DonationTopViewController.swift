//
//  DonationTopViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class DonationTopViewController: BaseViewController {
    var presenter: DonationTopPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var androidCard: CardView!
    @IBOutlet weak var androidName: UILabel!
    @IBOutlet weak var androidRole: UILabel!
    @IBOutlet weak var designerCard: CardView!
    @IBOutlet weak var designerName: UILabel!
    @IBOutlet weak var designerRole: UILabel!
    @IBOutlet weak var iosCard: CardView!
    @IBOutlet weak var iosName: UILabel!
    @IBOutlet weak var iosRole: UILabel!

    override func setup() {
        super.setup()
        
        title = R.string.localizable.donation_title()

        setDeveloperText(name: androidName, role: androidRole, developer: Developer.android)
        setDeveloperText(name: designerName, role: designerRole, developer: Developer.designer)
        setDeveloperText(name: iosName, role: iosRole, developer: Developer.ios)

        androidCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.android)
        }

        designerCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.designer)
        }

        iosCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.ios)
        }
    }

    func setDeveloperText(name: UILabel, role: UILabel, developer: Developer) {
        name.text = developer.name
        name.textColor = Theme.primary
        role.text = developer.role
        role.textColor = Theme.secondary
    }
}

extension DonationTopViewController: DonationTopView {
}
