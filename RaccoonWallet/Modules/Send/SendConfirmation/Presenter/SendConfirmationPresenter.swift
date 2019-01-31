//
//  SendConfirmationPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class SendConfirmationPresenter: BasePresenter {
    weak var view: SendConfirmationView?
    var interactor: SendConfirmationUseCase!
    var router: SendConfirmationWireframe!
    var sendTransaction: SendTransaction!
    
    var mosaicSupplyList: [MosaicSupply] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.showDestination(sendTransaction.address.prettyAddress(), sendTransaction.namespace)
        view?.showMessage(sendTransaction.message ?? "")
        
        if sendTransaction.isOnlyXem {
            let transaction = createDummyTransaction()
            view?.showAmounts(transaction.mosaics?.map {$0.amountDescription} ?? [])
            view?.showFee(MosaicDetail.xem(transaction.fee).amountDescription)
        } else {
            view?.showFee("")
            view?.showAmounts([])
            view?.showLoading()
            interactor.fetchMosaicSupply(
                sendTransaction.mosaics
                    .filter { !$0.isXem() }
                    .map { MosaicId(namespaceId: $0.namespace, name: $0.mosaic) }
            )
        }
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        if ApplicationSetting.shared.showsSendCaution {
            view?.showCaution()
        }
    }

    private func createEncryptedMessage(_ keyPair: KeyPair) -> [UInt8]? {
        guard let publicKey = sendTransaction.publicKey else {
            return nil
        }
        guard let message = sendTransaction.message else {
            return nil
        }
        return try? MessageEncryption.encrypt(
                senderKeys: keyPair,
                receiverPublicKey: ConvertUtil.toByteArray(publicKey),
                message: Array(message.utf8))
    }

    // create dummy transaction only for calculating fee
    private func createDummyTransaction() -> TransferTransactionHelper.Transaction {
        let account = Account.generateAccount(network: NemConfiguration.addressNetwork)
        return createTransaction(account.keyPair)
    }



    private func createTransaction(_ keyPair: KeyPair) -> TransferTransactionHelper.Transaction {
        var messageBytes: [UInt8]? = nil
        if let message = sendTransaction.message {
            if sendTransaction.messageType == .plain {
                messageBytes = Array(message.utf8)
            } else {
                if let encryptedMessage = createEncryptedMessage(keyPair) {
                    messageBytes = encryptedMessage
                } else {
                    view?.showError("Failed to encrypt message")
                }
            }
        }

        if sendTransaction.isOnlyXem {
            return TransferTransactionHelper.generateTransfer(
                    publicKey: keyPair.publicKey,
                    network: NemConfiguration.transactionNetwork,
                    recipientAddress: sendTransaction.address,
                    amount: sendTransaction.mosaics[0].quantity,
                    messageType: sendTransaction.messageType,
                    message: messageBytes ?? [])
        } else {

            return TransferTransactionHelper.generateMosaicTransfer(
                    publicKey: keyPair.publicKey,
                    network: NemConfiguration.transactionNetwork,
                    recipientAddress: sendTransaction.address,
                    mosaics: sendTransaction.mosaics.compactMap { mosaicDetail in
                        if mosaicDetail.isXem() {
                            return mosaicDetail.convertToTransferMosaicOfXem()
                        } else {
                            guard let supply = mosaicSupplyList.first(where: { $0.mosaicId.fullName == mosaicDetail.identifier }) else {
                                return nil
                            }
                            return mosaicDetail.convertToTransferMosaic(supply: supply.supply)
                        }
                    },
                    messageType: sendTransaction.messageType,
                    message: messageBytes ?? [])
        }
    }
}

extension SendConfirmationPresenter: PinDialogMixinPresentation {
    func didValidatePin(_ pin: String) {
        guard let wallet = WalletHelper.activeWallet else {
            view?.showError(R.string.localizable.wallet_not_select_message())
            return
        }
        guard let account = try? WalletHelper.repairAccount(from: wallet, password: pin) else{
            view?.showError(R.string.localizable.common_error_account_repair())
            return
        }

        let transaction = createTransaction(account.keyPair).toByteArray()

        view?.showLoading()
        interactor.sendTransaction(transaction, account.keyPair)
    }
}

extension SendConfirmationPresenter: SendConfirmationPresentation {
    func didClickNeverRemind() {
        ApplicationSetting.shared.showsSendCaution = false
    }

    func didClickBottomPanel() {
        guard PinPreference.shared.saved else {
            view?.showError(R.string.localizable.common_error_pin_not_set())
            return
        }
        view?.showPinDialog(presenter: self)
    }
}

extension SendConfirmationPresenter: SendConfirmationInteractorOutput {
    
    func mosaicSupplyListFetched(_ mosaicSupplyList: [MosaicSupply]) {
        view?.hideLoading()
        self.mosaicSupplyList = mosaicSupplyList

        let transaction = createDummyTransaction()
        view?.showAmounts(transaction.mosaics?.map {$0.amountDescription} ?? [])
        view?.showFee(MosaicDetail.xem(transaction.fee).amountDescription)
    }

    func mosaicSupplyListFetchFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(R.string.localizable.common_error_network())
    }
    

    func transactionSent(_ result: NemAnnounceResult) {
        view?.hideLoading()
        if result.isSuccess {
            router.presentSendEnd()
        } else {
            if result.isInsufficientBalance {
                view?.showError(R.string.localizable.common_error_insufficient_balance())
            } else{
                view?.showError(result.message)
            }

        }
    }

    func transactionSendFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(error.localizedDescription)
    }
}
