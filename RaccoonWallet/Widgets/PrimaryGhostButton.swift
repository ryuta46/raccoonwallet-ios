
//
// PrimaryCircleButton.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/30.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


class PrimaryGhostButton: UIButton {
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

        setTitleColor(Theme.primary, for: .normal)

        layer.cornerRadius = 0.5 * bounds.height
        layer.masksToBounds = false

        layer.borderWidth = 1
        layer.borderColor = Theme.primary.cgColor
    }
    
}
