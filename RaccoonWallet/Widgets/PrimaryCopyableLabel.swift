//
// PrimaryFloatingButton.swift
//
// Created by Taizo Kusuda on 2018/12/20.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class PrimaryCopyableLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        textColor = Theme.primary
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedAddress(_:))))
    }

    @objc func onTouchedAddress(_ sender: Any) {
        if let text = self.text {
            UIPasteboard.general.string = text
            parentViewController?.showInfoPopup(R.string.localizable.common_copy_to_clipboard())
        }
    }

}
