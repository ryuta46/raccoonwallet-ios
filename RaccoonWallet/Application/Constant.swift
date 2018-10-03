//
//  Constant.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class Constant {
    static let officialSiteUrl = URL(string: "https://raccoonwallet.com")!
    static let privacyPolicyUrl = URL(string: "https://raccoonwallet.com/tos_pp/")!
    static let helpUrl = URL(string: "https://raccoonwallet.com/help/")!
    static let discordInvitationUrl = URL(string: "https://discord.gg/FrvjRzm")!

    static let openSourceUrl = URL(string:UIApplicationOpenSettingsURLString)!

    static let privateKeyLength = 32
    static let addressLength = 40
    static let messageMaxLength = 1024

    static let barIconSize = 25
    static let nemIconSize = 36

    static let shadowOffset = CGSize(width: 0.4, height: 1.0)
    static let shadowOpacity: Float = 0.2
    static let shadowColor = UIColor.black.cgColor
    static let shadowRadius: CGFloat = 1.0

    static let outlineRadius: CGFloat = 4
    static let outlineWidth: CGFloat = 2

    static let tableReloadTopThreshold: CGFloat = 64.0
    static let tableLoadNextBottomThreshold: CGFloat = 16.0

    static let walletBarHeightOffset: CGFloat = 32.0
    static let tableHeaderHeight: CGFloat = 48.0
    static let walletBarButtonTapExpansion: CGFloat = 32.0

    static let maxNemNodes = 30


    // for Mosaic Gallery of OpenApostille
    static let oaMosaicImageKey = "oa:"
    static let oaMosaicImagePrefix = "https://s3.amazonaws.com/open-apostille-nemgallary-production/"
    static let oaMosaicImageSuffix = ".jpg"
    
    static let popupDuration: TimeInterval = 3.0
}
