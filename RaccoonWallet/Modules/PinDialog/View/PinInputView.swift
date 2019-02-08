//
//  PinInputView.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/23.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class PinInputView: UIView {
    var isInputted: Bool = false {
        didSet {
            if isInputted {
                backgroundColor = UIColor.darkGray
            } else {
                backgroundColor = UIColor.clear
            }
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
        backgroundColor = UIColor.clear
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 2

        layer.cornerRadius = 5.0
        layer.masksToBounds = false
    }

}
