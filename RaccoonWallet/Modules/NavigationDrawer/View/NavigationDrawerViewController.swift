//
//  NavigationDrawerViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class NavigationDrawerViewController: BaseViewController {
    var presenter: NavigationDrawerPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var statusBackground: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var homeItem: UIStackView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var addressBookItem: UIStackView!
    @IBOutlet weak var addressBookLabel: UILabel!
    @IBOutlet weak var galleryItem: UIStackView!
    @IBOutlet weak var galleryLabel: UILabel!
    @IBOutlet weak var donationItem: UIStackView!
    @IBOutlet weak var donationLabel: UILabel!
    @IBOutlet weak var aboutItem: UIStackView!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var helpItem: UIStackView!
    @IBOutlet weak var helpLabel: UILabel!
    @IBOutlet weak var settingItem: UIStackView!
    @IBOutlet weak var settingLabel: UILabel!

    override func setup() {
        super.setup()

        statusBackground.backgroundColor = Theme.primary
        
        homeLabel.text = "HOME"
        addressBookLabel.text = R.string.localizable.common_address_book()
        galleryLabel.text = R.string.localizable.common_mosaic_gallery()
        donationLabel.text = R.string.localizable.common_donation()
        aboutLabel.text = "About"
        helpLabel.text = "Help"
        settingLabel.text = R.string.localizable.common_settings()

        addTouchEvent(view: homeItem, selector: #selector(onTouchedHome(_:)))
        addTouchEvent(view: addressBookItem, selector: #selector(onTouchedAddressBook(_:)))
        addTouchEvent(view: galleryItem, selector: #selector(onTouchedGallery(_:)))
        addTouchEvent(view: donationItem, selector: #selector(onTouchedDonation(_:)))
        addTouchEvent(view: aboutItem, selector: #selector(onTouchedAbout(_:)))
        addTouchEvent(view: helpItem, selector: #selector(onTouchedHelp(_:)))
        addTouchEvent(view: settingItem, selector: #selector(onTouchedSetting(_:)))
    }

    @objc func onTouchedHome(_ sender: Any) {
        presenter.didClickHome()
    }

    @objc func onTouchedAddressBook(_ sender: Any) {
        presenter.didClickAddressBook()
    }

    @objc func onTouchedGallery(_ sender: Any) {
        presenter.didClickGallery()
    }

    @objc func onTouchedDonation(_ sender: Any) {
        presenter.didClickDonation()
    }

    @objc func onTouchedAbout(_ sender: Any) {
        presenter.didClickAbout()
    }

    @objc func onTouchedHelp(_ sender: Any) {
        presenter.didClickHelp()
    }

    @objc func onTouchedSetting(_ sender: Any) {
        presenter.didClickSetting()
    }

}

extension NavigationDrawerViewController: NavigationDrawerView {
    func showName(_ name: String) {
        self.name.text = name
    }

    func showAddress(_ address: String) {
        self.address.text = address
    }
}
