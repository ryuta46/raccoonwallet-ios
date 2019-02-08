//
//  NavigationDrawerPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class NavigationDrawerPresenter: BasePresenter {
    weak var view: NavigationDrawerView?
    var interactor: NavigationDrawerUseCase!
    var router: NavigationDrawerWireframe!

    override func viewWillAppear() {
        super.viewWillAppear()

        if let wallet = WalletHelper.activeWallet {
            view?.showName(wallet.name)
        } else {
            view?.showName(R.string.localizable.common_not_select())
        }
    }
}

extension NavigationDrawerPresenter: NavigationDrawerPresentation {
    func didClickHome() {
        router.presentHome()
    }

    func didClickAddressBook() {
        view?.showInfo(R.string.localizable.common_coming_soon())
        //router.presentAddressBook()
    }

    func didClickGallery() {
        router.presentGallery()
    }

    func didClickDonation() {
        router.presentDonation()
    }

    func didClickAbout() {
        router.presentAbout()
    }

    func didClickHelp() {
        router.presentHelp()
    }

    func didClickSetting() {
        router.presentSetting()
    }
}

extension NavigationDrawerPresenter: NavigationDrawerInteractorOutput {
}
