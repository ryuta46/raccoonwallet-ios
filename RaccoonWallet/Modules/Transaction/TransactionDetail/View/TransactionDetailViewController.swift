//
//  TransactionDetailViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift

class TransactionDetailViewController: BaseViewController {
    var presenter: TransactionDetailPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageCheck: UIImageView!
    @IBOutlet weak var mosaicLeftSpace: UIView!
    @IBOutlet weak var mosaicLabel: UILabel!
    @IBOutlet weak var mosaicCheck: UIImageView!
    @IBOutlet weak var directionImage: UIImageView!
    @IBOutlet weak var multisigDirectionImage: UIImageView!
    @IBOutlet weak var amountSign: UILabel!
    @IBOutlet weak var amountBrief: UILabel!
    @IBOutlet weak var unconfirmedIcon: UIImageView!
    @IBOutlet weak var confirmedIcon: UIImageView!
    @IBOutlet weak var peer: UILabel!
    @IBOutlet weak var fromHeadline: UILabel!
    @IBOutlet weak var fromAddress: UILabel!
    @IBOutlet weak var toHeadline: UILabel!
    @IBOutlet weak var toAddress: UILabel!
    @IBOutlet weak var amountHeadline: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var feeHeadline: UILabel!
    @IBOutlet weak var fee: UILabel!
    @IBOutlet weak var blockHeadline: UILabel!
    @IBOutlet weak var block: UILabel!
    @IBOutlet weak var transactionHashHeadline: UILabel!
    @IBOutlet weak var transactionHash: UILabel!
    @IBOutlet weak var mosaicsSeparator: UIView!
    @IBOutlet weak var mosaics: UILabel!
    @IBOutlet weak var messageHeadline: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var encryptedButton: PrimaryButton!

    //private var loadingView: LoadingView?
    private var loadingView: FullScreenLoadingView!
    
    override func setup() {
        super.setup()

        title = R.string.localizable.transaction_detail_title()

        peer.textColor = Theme.secondary
        fromHeadline.textColor = Theme.secondary
        fromAddress.textColor = Theme.primary
        toHeadline.textColor = Theme.secondary
        toAddress.textColor = Theme.primary
        amountHeadline.textColor = Theme.secondary
        amount.textColor = Theme.secondary
        feeHeadline.textColor = Theme.secondary
        fee.textColor = Theme.secondary
        blockHeadline.textColor = Theme.secondary
        block.textColor = Theme.secondary
        transactionHashHeadline.textColor = Theme.secondary
        transactionHash.textColor = Theme.primary
        messageHeadline.textColor = Theme.secondary
        message.textColor = Theme.secondary

        encryptedButton.setTitle(R.string.localizable.transaction_message_is_encrypted(), for: .normal)

        loadingView = createFullScreenLoadingView()
    }
    
    @IBAction func onTouchedEncryptedButton(_ sender: Any) {
        presenter.didClickEncrypted()
    }
}

extension TransactionDetailViewController: PinDialogMixinViewController {
}

extension TransactionDetailViewController: TransactionDetailView {
    func showTransaction(_ transaction: TransferTransactionDetail) {
        dateTime.text = transaction.dateTimeString
        messageLabel.isHidden = !transaction.hasMessage
        messageCheck.isHidden = !transaction.hasMessage

        mosaicLabel.isHidden = !transaction.hasMosaic
        mosaicCheck.isHidden = !transaction.hasMosaic
        mosaicLeftSpace.isHidden = !transaction.hasMosaic

        directionImage.image = transaction.directionImage
        multisigDirectionImage.image = transaction.multisigImage

        amountSign.text = transaction.directionText
        amountSign.textColor = transaction.directionColor
        amountBrief.text = transaction.briefAmountDescription

        unconfirmedIcon.isHidden = !transaction.isUnconfirmed
        confirmedIcon.isHidden = transaction.isUnconfirmed
        peer.text = transaction.peer.prettyAddress()

        fromAddress.text = transaction.sender.prettyAddress()
        toAddress.text = transaction.recipient.prettyAddress()

        fee.text = MosaicDetail.xem(transaction.fee).amountDescription
        if !transaction.hasMosaic {
            amount.text = MosaicDetail.xem(transaction.amount).amountDescription
            mosaicsSeparator.isHidden = true
            mosaics.isHidden = true
        } else {
            amountHeadline.isHidden = true
            amount.isHidden = true
            mosaics.text = transaction.mosaics.map { $0.amountDescription }.joined(separator: "\n")
        }
        block.text = transaction.block?.description ?? "-"
        transactionHash.text = transaction.hash ?? "-"
    }

    func showMessage(_ message: String) {
        self.encryptedButton.isHidden = true
        self.message.isHidden = false
        self.message.text = message
    }

    func showEncryptedButton() {
        self.encryptedButton.isHidden = false
        self.message.isHidden = true
    }

    func showPublicKeyLoading() {
        //loadingView = LoadingView(target: encryptedButton)
        //loadingView?.startLoading()
        loadingView.startLoading()
    }

    func hidePublicKeyLoading() {
        //loadingView?.stopLoading()
        //loadingView?.dispose()
        //loadingView = nil
        loadingView.stopLoading()
    }
}
