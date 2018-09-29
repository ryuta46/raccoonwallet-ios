//
// PrimaryCircleButton.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/30.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


class PrimaryCircleButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }


    private func setup() {
        backgroundColor = Theme.primary

        layer.cornerRadius = 0.5 * bounds.width
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0.4, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 1.0
    }

}
