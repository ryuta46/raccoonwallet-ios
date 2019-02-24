//
//  DonationDetailPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/12.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class DonationDetailPresenter: BasePresenter {
    weak var view: DonationDetailView?
    var interactor: DonationDetailUseCase!
    var router: DonationDetailWireframe!
    var developer: Developer!

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.showDeveloper(developer)
    }
}

extension DonationDetailPresenter: DonationDetailPresentation {
    func didClickGithub() {
        router.openUrl("https://github.com/\(developer.github)")
    }

    func dicClickTwitter() {
        router.openUrl("https://twitter.com/\(developer.twitter)")
    }

    func didClickDonate() {
        guard PinPreference.shared.saved else {
            view?.showNotSetPinError()
            return
        }
        guard WalletHelper.activeWallet != nil else {
            view?.showNotSelectWalletError()
            return
        }

        let sendTransaction = SendTransaction(address: developer.address, publicKey: developer.publicKey)
        router.presentSendAmount(sendTransaction: sendTransaction)
    }

    func didClickGoPinSetting() {
        router.presentSetting()
    }

    func didClickGoWalletSelect() {
        router.presentWalletSelect()
    }
}

extension DonationDetailPresenter: DonationDetailInteractorOutput {
}
