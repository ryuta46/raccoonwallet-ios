//
//  TransactionView.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2019/01/01.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class HarvestView: UIView {
    @IBOutlet weak var date: UILabel!
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
        let view = R.nib.harvestView.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)
    }
}
