//
//  PrimaryButton.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/17.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class PrimaryButton: MDCRaisedButton {
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
        backgroundColor = Theme.primary
    }
}
