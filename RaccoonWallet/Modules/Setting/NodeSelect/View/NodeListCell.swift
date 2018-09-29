//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import DLRadioButton

class NodeListCell: UITableViewCell {

    @IBOutlet weak var activeIndicator: DLRadioButton!
    @IBOutlet weak var nodeName: UILabel!

    private var onTouchedSettingHandler: (() -> Void)?

    override func awakeFromNib() {
        activeIndicator.isUserInteractionEnabled = false
        activeIndicator.iconSize = 16
        activeIndicator.iconColor = Theme.primary
        activeIndicator.indicatorSize = 8
        activeIndicator.indicatorColor = Theme.primary
    }
}
