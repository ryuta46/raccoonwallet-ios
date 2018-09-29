//
// SolidButton.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/30.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class SolidButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                backgroundColor = themeColor
            } else {
                backgroundColor = themeColor.lightened
            }
        }
    }

    var themeColor: UIColor = UIColor.clear {
        didSet {
            if self.isEnabled {
                backgroundColor = themeColor
            } else {
                backgroundColor = themeColor.lightened
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
        setTitleColor(UIColor.white, for: .normal)
    }
}
