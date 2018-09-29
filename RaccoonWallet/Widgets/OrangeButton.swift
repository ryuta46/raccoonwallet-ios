//
// Created by Taizo Kusuda on 2018/09/08.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents.MDCButton

class OrangeButton: MDCRaisedButton {
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
        backgroundColor = Theme.nemOrange
    }
}
