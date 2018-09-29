//
//  SendTabPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/02.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendTabPresenter: BasePresenter {
    weak var view: SendTabView?
    var interactor: SendTabUseCase!
    var router: SendTabWireframe!
    var destination: String = ""
    var destinationPublicKey: String?

    override func viewDidLoad() {
        view?.showPaste()
        view?.showOk()
    }
}

extension SendTabPresenter: SendTabPresentation {
    func didChangeDestination(_ destination: String) {
        self.destination = destination
        if destination.isEmpty {
            view?.showPaste()
        } else {
            view?.showClear()
        }
    }

    func didClickPaste() {
        if let text = UIPasteboard.general.string {
            view?.setDestination(text)
        }
    }

    func didClickClear() {
        view?.setDestination("")
    }

    func didClickOk() {
        guard PinPreference.shared.saved else {
            view?.showNotSetPinError()
            return
        }
        guard WalletHelper.activeWallet != nil else {
            view?.showNotSelectWalletError()
            return
        }

        let plainAddress = destination.plainAddress()
        guard plainAddress.count == Constant.addressLength else {
            view?.showError(R.string.localizable.common_invalid_address())
            return
        }

        interactor.fetchPublicKey(plainAddress)
        view?.showLoading()
    }

    func didClickNewbieOk() {
        router.presentSendAmount(destination: destination.plainAddress(), destinationPublicKey: destinationPublicKey)
    }

    func didClickGoPinSetting() {
        router.presentSetting()
    }

    func didClickGoWalletSelect() {
        router.presentWalletSelect()
    }
}

extension SendTabPresenter : SendTabInteractorOutput {
    func publicKeyFetched(_ publicKey: String?) {
        destinationPublicKey = publicKey
        if publicKey == nil {
            view?.showNewbieDialog()
        } else {
            router.presentSendAmount(destination: destination.plainAddress(), destinationPublicKey: destinationPublicKey)
        }
        view?.showOk()
    }

    func publicKeyFetchFailed(_ error: Error) {
        view?.showError(R.string.localizable.common_error_network())
        view?.showOk()
    }
}
