//
//  Calculator.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/29.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MathParser

protocol CalculatorDelegate: class {
    func onChangedFormula(formula: String)
    func onCalculated(_ value: Decimal)
    func onConfirmed(_ value: Decimal)
}

class Calculator: UIView {
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var backspace: UIButton!
    
    @IBOutlet weak var clear: UIButton!
    
    @IBOutlet weak var go: OrangeSolidButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var mult: UIButton!
    @IBOutlet weak var divide: UIButton!
    @IBOutlet weak var equal: UIButton!

    weak var delegate: CalculatorDelegate?
    let precision: Int16 = 6

    var formula = "0"
    private var calculatedTemporary = false // set after pressed equal
    private var operators: [UIButton] = []

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        let view = R.nib.calculator.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)

        minus.backgroundColor = Theme.primary
        plus.backgroundColor = Theme.primary
        mult.backgroundColor = Theme.primary
        divide.backgroundColor = Theme.primary
        equal.backgroundColor = Theme.primary

        let numbers = [
            number0, number1, number2, number3, number4,
            number5, number6, number7, number8, number9,
            point,
        ]

        for number in numbers {
            number?.addTarget(self, action: #selector(onTouchedNumber(_:)), for: .touchUpInside)
        }

        operators = [minus, plus, mult, divide]

        for op in operators {
            op.addTarget(self, action: #selector(onTouchedOperator(_:)), for: .touchUpInside)
        }

        equal.addTarget(self, action: #selector(onTouchedEqual(_:)), for: .touchUpInside)

        backspace.addTarget(self, action: #selector(onTouchedBackspace(_:)), for: .touchUpInside)
        clear.addTarget(self, action: #selector(onTouchedClear(_:)), for: .touchUpInside)

        go.addTarget(self, action: #selector(onTouchedGo(_:)), for: .touchUpInside)

    }
    @objc func onTouchedNumber(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            addNumber(text)
        }
    }

    @objc func onTouchedOperator(_ sender: UIButton) {
        if let text = sender.title(for: .normal) {
            addOperator(text)
        }
    }

    @objc func onTouchedEqual(_ sender: Any) {
        updateFormulaToEvaluated()
    }

    @objc func onTouchedBackspace(_ sender: Any) {
        removeLastFormulaElement()
    }

    @objc func onTouchedClear(_ sender: Any) {
        clearFormula()
    }

    @objc func onTouchedGo(_ sender: Any) {
        if let evaluated = try? formula.evaluate() {
            let value = Decimal(evaluated).round(precision)
            notifyFormulaConfirmed(value)
        }
    }

    private func addNumber(_ element: String) {
        if calculatedTemporary {
            formula = ""
            calculatedTemporary = false
        }
        if formula == "0" && element != "."{
            formula = ""
        }
        formula += element
        evaluate()
    }

    private func addOperator(_ element: String) {
        calculatedTemporary = false

        // if last char is also operator, replace it
        let operatorChars = operators.map { $0.title(for: .normal)}
        if operatorChars.contains(formula.last?.description) {
            formula = String(formula.dropLast())
        }

        // If formula has operator, calculate it first and add operator
        if Double(formula) == nil{
            if let evaluated = try? formula.evaluate() {
                let newValue = Decimal(evaluated).round(precision)
                notifyFormulaCalculated(newValue)
                formula = newValue.description
            }
        }
        formula += element

        evaluate()
    }

    private func removeLastFormulaElement() {
        formula = String(formula.dropLast())
        if formula.isEmpty {
            formula = "0"
        }
        evaluate()
    }

    private func clearFormula() {
        calculatedTemporary = false
        formula = "0"
        evaluate()
    }

    private func updateFormulaToEvaluated() {
        if let evaluated = try? formula.evaluate() {
            formula = Decimal(evaluated).round(precision).description
            evaluate()
            calculatedTemporary = true
        }
    }

    private func evaluate() {
        notifyFormulaChanged()

        // If formula has only numbers, calculate it automatically.
        if formula.isNumber {
            if let decimal = Decimal(string: formula) {
                notifyFormulaCalculated(decimal)
            }
        }

        go.isEnabled = formula.isNumber
    }


    private func notifyFormulaChanged() {
        delegate?.onChangedFormula(formula: formula)
    }

    private func notifyFormulaCalculated(_ value: Decimal) {
        delegate?.onCalculated(value)
    }


    private func notifyFormulaConfirmed(_ value: Decimal) {
        delegate?.onConfirmed(value)
    }


}
