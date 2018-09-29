//
//  OrangeSolidButton.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class OrangeSolidButton: SolidButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        themeColor = Theme.nemOrange
    }
}
