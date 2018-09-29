//
//  TransactionView.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class TransactionView: UIView {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var directionImage: UIImageView!
    @IBOutlet weak var multisigDirectionImage: UIImageView!
    @IBOutlet weak var amount: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        let view = R.nib.transactionView.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)
    }
}
