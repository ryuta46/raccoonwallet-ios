//
// Created by Taizo Kusuda on 2018/09/06.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LightGrayLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }


    private func setup() {
        textColor = Theme.textLightGray
    }
}
