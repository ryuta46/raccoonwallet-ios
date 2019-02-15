//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class TransactionListHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        layer.shadowColor = Constant.shadowColor
        layer.shadowOffset = Constant.shadowOffset
        layer.shadowRadius = Constant.shadowRadius
        layer.shadowOpacity = Constant.shadowOpacity
        layer.masksToBounds = false
    }
    
}
