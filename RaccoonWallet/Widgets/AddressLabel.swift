//
// AddressLabel.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/30.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class AddressLabel: UILabel {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedAddress(_:))))
    }

    @objc func onTouchedAddress(_ sender: Any) {
        if let text = self.text {
            UIPasteboard.general.string = text
            parentViewController?.showInfoPopup("Address Copied")
        }
    }

}
