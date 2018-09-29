//
//  PinNumberView.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//


import UIKit

protocol PinNumberViewDelegate: class {
    func onTouched(_ number: Int)
}

class PinNumberView: UIView {
    weak var delegate: PinNumberViewDelegate?
    @IBOutlet weak var numberButton: UIButton!

    var number: Int = 0 {
        didSet {
            numberButton.setTitle(String(number), for: .normal)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }


    private func setup() {
        let view = R.nib.pinNumberView.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)

        backgroundColor = UIColor.clear
        numberButton.layer.borderColor = UIColor.white.cgColor
        numberButton.layer.borderWidth = 2

        numberButton.layer.cornerRadius = 10.0
        numberButton.layer.masksToBounds = false
    }

    @IBAction func onTouchedNumber(_ sender: Any) {
        delegate?.onTouched(number)
    }
}
