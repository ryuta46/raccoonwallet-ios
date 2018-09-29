//
//  QrLabAmountViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class QrLabAmountViewController : BaseViewController {
    var presenter: QrLabAmountPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var amountHeadline: UILabel!
    @IBOutlet weak var calculator: Calculator!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var unit: UILabel!
    @IBOutlet weak var convertedAmount: UILabel!
    @IBOutlet weak var convertedUnit: UILabel!
    
    override func setup() {
        super.setup()
        title = R.string.localizable.qrlab_amount_title()
        hideBackTitle()

        amountHeadline.text = R.string.localizable.common_amount()
        amountHeadline.textColor = Theme.primary

        calculator.delegate = self
    }
    
    @IBAction func onTouchedSwitchUnit(_ sender: Any) {
        presenter.didClickSwitchUnit()
    }
    
}

extension QrLabAmountViewController : QrLabAmountView {
    func showValues(target: String, converted: String) {
        amount.text = target
        convertedAmount.text = converted

        calculator.formula = target
    }

    func showCurrencyUnits(target: String, converted: String) {
        unit.text = target
        convertedUnit.text = converted
    }

}

extension QrLabAmountViewController: CalculatorDelegate {
    func onChangedFormula(formula: String) {
        presenter.didChangeFormula(formula)
    }

    func onCalculated(_ value: Decimal) {
        presenter.didCalculateFormula(value)
    }

    func onConfirmed(_ value: Decimal) {
        presenter.didCalculateFormula(value)
        presenter.didConfirm()
    }
}
