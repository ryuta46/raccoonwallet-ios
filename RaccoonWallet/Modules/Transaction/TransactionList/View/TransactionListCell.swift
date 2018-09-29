//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class TransactionListCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageCheck: UIImageView!
    @IBOutlet weak var mosaicLeftSpace: UIView!
    @IBOutlet weak var mosaicLabel: UILabel!
    @IBOutlet weak var mosaicCheck: UIImageView!
    @IBOutlet weak var directionImage: UIImageView!
    @IBOutlet weak var multisigDirectionImage: UIImageView!
    @IBOutlet weak var amountSign: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var unconfirmedIcon: UIImageView!
    @IBOutlet weak var confirmedIcon: UIImageView!
    @IBOutlet weak var peer: UILabel!
    
    
    override func awakeFromNib() {
    }
    
}
