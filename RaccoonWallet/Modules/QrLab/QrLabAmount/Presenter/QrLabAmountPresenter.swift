//
//  QrLabAmountPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class QrLabAmountPresenter: BasePresenter {
    weak var view: QrLabAmountView?
    var interactor: QrLabAmountUseCase!
    var router: QrLabAmountWireframe!

    var formula = ""
    var amount = Decimal(0)
    var converted = Decimal(0)
    var rate: Decimal?

    var amountUnit: Currency = .xem
    // TODO: localize
    var convertedUnit: Currency = .jpy

    override func viewDidLoad() {
        view?.showCurrencyUnits(target: amountUnit.rawValue, converted: convertedUnit.rawValue)

        interactor.fetchRate(convertedUnit)
    }
}

extension QrLabAmountPresenter: QrLabAmountPresentation {
    func didChangeFormula(_ formula: String) {
        self.formula = formula
        view?.showValues(target: formula, converted: converted.description)
    }

    func didCalculateFormula(_ value: Decimal) {
        self.amount = value
        if let rate = rate {
            if amountUnit == .xem {
                converted = (value * rate).round(convertedUnit.precision)
            } else {
                converted = (value / rate).round(convertedUnit.precision)
            }

        }
        view?.showValues(target: formula, converted: converted.description)
    }

    func didClickSwitchUnit() {
        swap(&amount, &converted)
        swap(&amountUnit, &convertedUnit)

        view?.showValues(
                target: amount.round(amountUnit.precision).description,
                converted: converted.round(convertedUnit.precision).description)
        view?.showCurrencyUnits(target: amountUnit.rawValue, converted: convertedUnit.rawValue)
    }

    func didConfirm() {
        if amountUnit == .xem {
            router.presentQrLabInvoice(amount: amount, localCurrencyAmount: converted, localCurrencyUnit: convertedUnit.rawValue)
        } else {
            router.presentQrLabInvoice(amount: converted, localCurrencyAmount: amount, localCurrencyUnit: amountUnit.rawValue)
        }
    }

}

extension QrLabAmountPresenter : QrLabAmountInteractorOutput {
    func rateFetched(_ rate: Decimal) {
        self.rate = rate
    }

    func rateFetchFailed(_ error: Error) {
        view?.showError(R.string.localizable.common_error_network())
    }
}
