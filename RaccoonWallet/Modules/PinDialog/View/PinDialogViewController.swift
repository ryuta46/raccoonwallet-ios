//
//  PinDialogViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class PinDialogViewController: BaseViewController{
    var presenter: PinDialogPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var pinInput0: PinInputView!
    @IBOutlet weak var pinInput1: PinInputView!
    @IBOutlet weak var pinInput2: PinInputView!
    @IBOutlet weak var pinInput3: PinInputView!
    @IBOutlet weak var pinInput4: PinInputView!
    @IBOutlet weak var pinInput5: PinInputView!
    
    @IBOutlet weak var pinNumber0: PinNumberView!
    @IBOutlet weak var pinNumber1: PinNumberView!
    @IBOutlet weak var pinNumber2: PinNumberView!
    @IBOutlet weak var pinNumber3: PinNumberView!
    @IBOutlet weak var pinNumber4: PinNumberView!
    @IBOutlet weak var pinNumber5: PinNumberView!
    @IBOutlet weak var pinNumber6: PinNumberView!
    @IBOutlet weak var pinNumber7: PinNumberView!
    @IBOutlet weak var pinNumber8: PinNumberView!
    @IBOutlet weak var pinNumber9: PinNumberView!

    @IBOutlet weak var back: UIButton!
    var pinInputs: [PinInputView]!
    var pinNumbers: [PinNumberView]!

    override func setup() {
        super.setup()

        pinInputs = [
            pinInput0,
            pinInput1,
            pinInput2,
            pinInput3,
            pinInput4,
            pinInput5,
        ]

        pinNumbers = [
            pinNumber0,
            pinNumber1,
            pinNumber2,
            pinNumber3,
            pinNumber4,
            pinNumber5,
            pinNumber6,
            pinNumber7,
            pinNumber8,
            pinNumber9,
        ]

        for pinInput in pinInputs {
            pinInput.isInputted = false
        }
        for pair in pinNumbers.enumerated() {
            pair.element.number = pair.offset
            pair.element.delegate = self
        }
    }
    
    @IBAction func onTouchedBack(_ sender: Any) {
        presenter.didClickCancel()
    }
}

extension PinDialogViewController: PinDialogView {
    func showInputted(_ count: Int) {
        for i in 0..<pinInputs.count {
            pinInputs[i].isInputted = i < count
        }
    }

    func showMessage(_ message: String) {
        self.message.text = message
    }

    func showResult(_ result: Bool) {
        if !result {
            showErrorPopup(R.string.localizable.common_pin_retry())
        }
    }

    func showRegistrationMessage() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.common_pin_settings(),
                messages: [R.string.localizable.common_pin_registration_message_0(), R.string.localizable.common_pin_registration_message_1()])

        present(dialog, animated: true)
    }

    func hideCancel() {
        back.isHidden = true
    }
}

extension PinDialogViewController : PinNumberViewDelegate {
    func onTouched(_ number: Int) {
        presenter.didClickNumber(number)
    }
}
