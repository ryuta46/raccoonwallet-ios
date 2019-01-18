//
//  Created by Taizo Kusuda on 2019/01/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class PrimaryTextButton: UIButton {
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
    }
}

