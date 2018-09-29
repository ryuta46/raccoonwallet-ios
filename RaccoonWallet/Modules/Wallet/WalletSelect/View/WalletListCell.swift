//
//  WalletListCell.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/17.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import DLRadioButton
import FontAwesome_swift


class WalletListCell: UITableViewCell {

    @IBOutlet weak var activeIndicator: DLRadioButton!
    @IBOutlet weak var walletName: UILabel!

    @IBOutlet weak var settingButton: UIButton!

    private var onTouchedSettingHandler: (() -> Void)?

    override func awakeFromNib() {
        activeIndicator.isUserInteractionEnabled = false
        activeIndicator.iconSize = 16
        activeIndicator.iconColor = Theme.primary
        activeIndicator.indicatorSize = 8
        activeIndicator.indicatorColor = Theme.primary

        settingButton.setTitleColor(Theme.primary, for: .normal)
        settingButton.titleLabel?.font = UIFont.fontAwesome(ofSize: 24, style: .solid)
        settingButton.setTitle(String.fontAwesomeIcon(name: .cog), for: .normal)

        settingButton.addTarget(self, action: #selector(onTouchedSetting(_:)), for: .touchUpInside)
    }

    @objc func onTouchedSetting(_ sender: Any) {
        onTouchedSettingHandler?()
    }

    func setOnTouchedSetting(handler: @escaping () ->Void) {
        onTouchedSettingHandler = handler
    }
}
