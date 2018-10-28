//
//  SendConfirmationViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents

class SendConfirmationViewController: BaseViewController {
    var presenter: SendConfirmationPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var amountHeadline: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var feeHeadline: UILabel!
    @IBOutlet weak var fee: UILabel!
    @IBOutlet weak var destinationHeadline: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var messageHeadline: UILabel!
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var confirmation: UIButton!
    
    var loadingView: FullScreenLoadingView!

    private var bottomPanelInk: MDCInkTouchController!
    override func setup() {
        super.setup()
        
        title = R.string.localizable.send_confirmation_title()
        hideBackTitle()
        amountHeadline.text = R.string.localizable.common_amount()
        feeHeadline.text = R.string.localizable.common_fee()
        destinationHeadline.text = R.string.localizable.common_destination()
        messageHeadline.text = R.string.localizable.common_message()
        
        loadingView = createFullScreenLoadingView()

        confirmation.setTitle(R.string.localizable.send_confirmation_button(), for: .normal)
        confirmation.setTitleColor(UIColor.white, for: .normal)
        confirmation.backgroundColor = Theme.primary
    }

    @IBAction func onTouchedConfirmation(_ sender: Any) {
        presenter.didClickBottomPanel()
    }
}

extension SendConfirmationViewController: PinDialogMixinViewController {
    func showPinDialog(presenter: PinDialogMixinPresentation) {
        let dialog = PinDialogRouter.assembleModule(forRegistration: false,
                                                    cancelable: true,
                                                    message: R.string.localizable.send_confirmation_pin_message()
        ) { pin in
            if let pin = pin {
                presenter.didValidatePin(pin)
            } else {
                presenter.didCancelPin()
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}

extension SendConfirmationViewController: SendConfirmationView {
    func showCaution() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.send_confirmation_title(),
                messages: [R.string.localizable.send_confirmation_dialog_message()],
                mode: .neverRemind) { [weak self] result in
            if result == .neverRemind {
                self?.presenter.didClickNeverRemind()
            }
        }
        navigationController?.present(dialog, animated: true)
    }

    func showAmounts(_ amounts: [String]) {
        amount.text = amounts.joined(separator: "\n")
    }

    func showFee(_ fee: String) {
        self.fee.text = fee
    }

    func showDestination(_ destination: String) {
        self.destination.text = destination
    }

    func showMessage(_ message: String) {
        self.message.text = message
    }

    func showLoading() {
        loadingView.startLoading()
    }
    func hideLoading() {
        loadingView.stopLoading()
    }
}
