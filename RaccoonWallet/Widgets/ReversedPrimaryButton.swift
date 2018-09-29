//
// Created by Taizo Kusuda on 2018/09/14.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import MaterialComponents.MDCButton

class ReversedPrimaryButton: MDCRaisedButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }


    private func setup() {
        setTitleColor(Theme.primary, for: .normal)
        backgroundColor = UIColor.white
    }
}
