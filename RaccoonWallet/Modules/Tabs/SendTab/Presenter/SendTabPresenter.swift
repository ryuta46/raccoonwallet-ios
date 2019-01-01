//
//  SendTabPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/02.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import NemSwift
import APIKit

class SendTabPresenter: BasePresenter {
    weak var view: SendTabView?
    var interactor: SendTabUseCase!
    var router: SendTabWireframe!
    var namespace: String = ""
    var destination: String = ""
    var destinationPublicKey: String?

    override func viewDidLoad() {
        view?.showPaste()
        view?.showOk()
    }
}

extension SendTabPresenter: SendTabPresentation {
    func didChangeDestination(_ destination: String) {
        if destination.starts(with: "@") {
            namespace = destination
            self.destination = ""
        } else {
            namespace = ""
            self.destination = destination
        }

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

        if !namespace.isEmpty {
            interactor.fetchNamespace(String(namespace.suffix(namespace.count - 1)))
            view?.showLoading()
        } else {
            let plainAddress = destination.plainAddress()
            guard plainAddress.count == Constant.addressLength else {
                view?.showError(R.string.localizable.common_invalid_address())
                return
            }

            interactor.fetchPublicKey(plainAddress)
            view?.showLoading()
        }
    }

    func didClickNewbieOk() {
        router.presentSendAmount(destination: destination.plainAddress(), destinationPublicKey: destinationPublicKey, namespace: namespace)
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
            router.presentSendAmount(destination: destination.plainAddress(), destinationPublicKey: destinationPublicKey, namespace: namespace)
        }
        view?.showOk()
    }

    func publicKeyFetchFailed(_ error: Error) {
        view?.showError(R.string.localizable.common_error_network())
        view?.showOk()
    }

    func namespaceFetched(_ namespace: Namespace) {
        destination = namespace.owner
        interactor.fetchPublicKey(destination)
    }

    func namespaceFetchFailed(_ error: Error) {
        if let sessionTaskError = error as? SessionTaskError, case .responseError(_) = sessionTaskError {
            view?.showError(R.string.localizable.send_invalid_namespace())
        } else {
            view?.showError(R.string.localizable.common_error_network())
        }
        view?.showOk()
    }
}
