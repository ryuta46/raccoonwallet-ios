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
    
    @IBOutlet weak var yukiCard: CardView!
    @IBOutlet weak var yukiName: UILabel!
    @IBOutlet weak var yukiRole: UILabel!
    @IBOutlet weak var somaCard: CardView!
    @IBOutlet weak var somaName: UILabel!
    @IBOutlet weak var somaRole: UILabel!
    @IBOutlet weak var rhimeCard: CardView!
    @IBOutlet weak var rhimeName: UILabel!
    @IBOutlet weak var rhimeRole: UILabel!
    @IBOutlet weak var ryutaCard: CardView!
    @IBOutlet weak var ryutaName: UILabel!
    @IBOutlet weak var ryutaRole: UILabel!
    
    override func setup() {
        super.setup()
        
        title = R.string.localizable.donation_title()

        setDeveloperText(name: yukiName, role: yukiRole, developer: Developer.yuki)
        setDeveloperText(name: somaName, role: somaRole, developer: Developer.soma)
        setDeveloperText(name: rhimeName, role: rhimeRole, developer: Developer.rhime)
        setDeveloperText(name: ryutaName, role: ryutaRole, developer: Developer.ryuta)

        yukiCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.yuki)
        }

        somaCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.soma)
        }

        rhimeCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.rhime)
        }

        ryutaCard.setOnTouchedHandler {
            self.presenter.didClickDeveloper(Developer.ryuta)
        }
    }

    func setDeveloperText(name: UILabel, role: UILabel, developer: Developer) {
        name.text = developer.name
        role.text = developer.role
        role.textColor = Theme.secondary
    }
}

extension DonationTopViewController: DonationTopView {
}
