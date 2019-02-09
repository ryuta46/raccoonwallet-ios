//
//  SendAmountPage.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/03.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class SendAmountPage: UIView {
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var balanceHeadline: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var localCurrencyAmount: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        let view = R.nib.sendAmountPage.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)

        headline.text = R.string.localizable.common_amount()
        balance.text = R.string.localizable.common_balance()
    }

}
