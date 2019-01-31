//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

struct TransferTransactionDetail {
    let timeStamp: UInt
    let fee: UInt64
    let id: Int?
    let hash: String?
    let block: Int?
    let sender: String // sender address

    let amount: UInt64
    let recipient: String
    let mosaics: [MosaicDetail]
    let message: String?
    let messageType: TransferTransactionHelper.MessageType

    let isMultisig: Bool
    let isReceive: Bool


    init?(_ transaction: Transaction, id: Int?, hash: String?, block: Int?, ownerAddress: String, mosaicDefinitions: [MosaicDefinition]){
        guard transaction.isTransfer || (transaction.isMultisig && transaction.otherTrans?.isTransfer ?? false) else {
            return nil
        }
        self.id = id
        self.hash = hash
        self.block = block

        timeStamp = transaction.timeStamp
        fee = UInt64(transaction.fee)
        isMultisig = transaction.isMultisig
        let senderPublicKey = transaction.otherTrans?.signer ?? transaction.signer
        sender = Address(publicKey: ConvertUtil.toByteArray(senderPublicKey), network: NemConfiguration.addressNetwork).value

        let transferTransaction = transaction.isTransfer ? transaction : transaction.otherTrans!

        amount = UInt64(transferTransaction.amount!)

        recipient = transferTransaction.recipient!
        isReceive = recipient == ownerAddress
        message = transferTransaction.message?.payload
        messageType = transaction.message?.type == UInt(TransferTransactionHelper.MessageType.secure.rawValue) ? .secure : .plain

        if let mosaics = transferTransaction.mosaics {
            var mosaicAmounts: [MosaicDetail] = []
            for mosaic in mosaics {
                if mosaic.mosaicId.isXem { // for xem
                    mosaicAmounts.append(MosaicDetail.xem(UInt64(mosaic.quantity)))
                    continue
                }

                guard let definition = mosaicDefinitions.filter({ definition in mosaic.mosaicId.description == definition.id.description }).first else {
                    Logger.shared.warning("No satisfied mosaic definition.")
                    mosaicAmounts.append(
                            MosaicDetail(
                                    namespace: mosaic.mosaicId.namespaceId,
                                    mosaic: mosaic.mosaicId.name,
                                    quantity: UInt64(mosaic.quantity),
                                    divisibility: nil,
                                    description: nil
                            ))
                    continue
                }
                guard let divisibility = definition.divisibility else{
                    Logger.shared.error("No initialSupply or divisibility.")
                    return nil
                }
                mosaicAmounts.append(
                        MosaicDetail(
                                namespace: definition.id.namespaceId,
                                mosaic: definition.id.name,
                                quantity: UInt64(mosaic.quantity),
                                divisibility: divisibility,
                                description: definition.description
                        ))
            }
            self.mosaics = mosaicAmounts
        } else {
            self.mosaics = []
        }
    }

    var briefAmountDescription: String {
        if mosaics.isEmpty {
            return MosaicDetail.xem(amount).amountDescription
        }

        if mosaics.count == 1 {
            return mosaics[0].amountDescription
        } else {
            return "\(mosaics.count) MOSAICS"
        }
    }

    var directionText: String {
        if isReceive {
            return "+"
        } else {
            return "-"
        }
    }

    var directionColor: UIColor {
        if isReceive {
            return Theme.primary
        } else {
            return Theme.nemOrange
        }
    }

    var directionImage: UIImage {
        if isReceive {
            return R.image.icon_transaction_receive_green()!
        } else {
            return R.image.icon_transaction_receive_red()!
        }
    }
    var multisigImage: UIImage? {
        guard isMultisig else {
            return nil
        }
        if isReceive {
            return R.image.icon_multisignature_green()
        } else {
            return R.image.icon_multisignature_red()
        }
    }

    // 09/07 2018 style
    var dateString: String {
        return timeStamp.dateAsTimestamp().dateString
    }
    // 18:30:55 style
    var timeInDayString: String {
        return timeStamp.dateAsTimestamp().timeInDayString
    }

    // 09/07 2018 18:30 style
    var dateTimeString: String {
        return timeStamp.dateAsTimestamp().dateTimeString
    }


    var isUnconfirmed: Bool {
        return block == nil
    }

    var peer: String {
        if isReceive {
            return sender
        }
        else {
            return recipient
        }
    }

    var hasMessage: Bool {
        return message != nil
    }

    var hasMosaic: Bool {
        return !mosaics.isEmpty
    }
}
