//
//  TransactionDetailPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class TransactionDetailPresenter: BasePresenter {
    weak var view: TransactionDetailView?
    var interactor: TransactionDetailUseCase!
    var router: TransactionDetailWireframe!
    var transaction: TransferTransactionDetail!
    var peerPublicKey: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.showTransaction(transaction)

        if !transaction.hasMessage {
            view?.showMessage("")
        } else {
            if transaction.messageType == .plain {
                if let message = String(bytes: ConvertUtil.toByteArray(transaction.message!), encoding: .utf8) {
                    view?.showMessage(message)
                } else {
                    view?.showError(R.string.localizable.common_error_decode_message())
                    view?.showMessage("")
                }
            } else {
                view?.showEncryptedButton()
            }
        }
    }
}

extension TransactionDetailPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        decryptMessage(pin: pin)
    }
}

extension TransactionDetailPresenter: TransactionDetailPresentation {
    func didClickEncrypted() {
        view?.showPublicKeyLoading()
        interactor.fetchPublicKey(transaction.peer)
    }

    private func decryptMessage(pin: String) {
        guard let wallet = WalletHelper.activeWallet else {
            view?.showError(R.string.localizable.wallet_not_select_message())
            return
        }
        guard let account = try? WalletHelper.repairAccount(from: wallet, password: pin) else {
            view?.showError(R.string.localizable.common_error_account_repair())
            return
        }

        guard let messageByteString = transaction.message else {
            Logger.shared.error("Message is not encrypted.")
            return
        }

        let messageBytes = ConvertUtil.toByteArray(messageByteString)

        guard let decryptedMessageBytes = try? MessageEncryption.decrypt(
                receiverKeys: account.keyPair,
                senderPublicKey: ConvertUtil.toByteArray(peerPublicKey),
                mergedEncryptedMessage: messageBytes),
              let decryptedMessage = String(bytes: decryptedMessageBytes, encoding: .utf8)
                else {
            view?.showError(R.string.localizable.common_error_decode_message())
            return
        }
        view?.showMessage(decryptedMessage)
    }
}

extension TransactionDetailPresenter: TransactionDetailInteractorOutput {
    func publicKeyFetched(_ publicKey: String?) {
        view?.hidePublicKeyLoading()
        guard let publicKey = publicKey else {
            // This is illegal case for NEM
            view?.showError(R.string.localizable.common_error_network())
            return
        }
        peerPublicKey = publicKey

        if PinPreference.shared.saved {
            view?.showPinDialog(presenter: self)
        } else {
            decryptMessage(pin: PinPreference.DEFAULT_PIN)
        }
    }

    func publicKeyFetchFailed(_ error: Error) {
        view?.hidePublicKeyLoading()
        view?.showError(R.string.localizable.common_error_network())
    }
}
