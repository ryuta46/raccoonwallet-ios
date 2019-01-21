//
//  Created by Taizo Kusuda on 2019/01/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class BalanceCard: UIView {
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var xem: UILabel!
    @IBOutlet weak var localCurrency: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        let view = R.nib.balanceCard.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)
    }


    func setXem(_ xem: Decimal) {
        self.xem.text = xem.description
    }

    func clearXem() {
        self.xem.text = "-"
    }

    func setLocalCurrency(_ value: Decimal, _ unit: Currency) {
        self.localCurrency.text = "\(unit.rawValue) : \(value.round(3).description)"
    }

    func clearLocalCurrency() {
        self.localCurrency.text = "-"
    }

}
