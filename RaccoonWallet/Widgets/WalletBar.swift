//
//  WalletBar.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletBar: UIView {
    @IBOutlet weak var icon: UIButton!
    //@IBOutlet weak var iconBackground: UIView!

    @IBOutlet weak var name: UILabel!
    
    var wallet: Wallet?
    
    var isOpened = false {
        didSet {
            if isOpened {
                icon.setImage(R.image.icon_wallet_back(), for: .normal)
            } else {
                icon.setImage(R.image.icon_wallet_16x16(), for: .normal)
            }
        }
    }

    var hasIcon = true {
        didSet {
            //iconBackground.isHidden = !hasIcon
            icon.isHidden = !hasIcon
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    override func willMove(toWindow newWindow: UIWindow?) {
        reloadWallet()
    }

    private func setup() {
        let view = R.nib.walletBar.firstView(owner: self)!
        view.frame = self.bounds
        self.addSubview(view)
    }

    @IBAction func onTouchedWalletIcon(_ sender: Any) {
        if let navigationController = navigationController {
            if !isOpened {
                let view = WalletSelectRouter.assembleModule()
                navigationController.pushViewControllerFromTop(view)
            } else {
                navigationController.popViewControllerFromBottom()
            }
        }
    }
    
    func reloadWallet() {
        if let wallet = self.wallet {
            self.name.text = wallet.name
        } else if let name = WalletHelper.activeWallet?.name {
            self.name.text = name
        } else {
            self.name.text = R.string.localizable.common_not_select()
        }
    }

}
