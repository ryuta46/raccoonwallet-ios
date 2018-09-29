//
//  ApplicationSetting.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/21.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class ApplicationSetting {
    
    static let shared = ApplicationSetting()
    
    private let userDefaults: UserDefaults

    private static let KEY_IS_FIRST_LAUNCH = "key_is_first_launch"
    private static let KEY_SHOWS_SEND_CAUTION = "key_shows_send_caution"
    private static let KEY_IS_ENABLED_BIOMETRY = "key_is_enabled_biometry"
    private static let KEY_IS_PIN_REQUIRED_ON_LAUNCH = "key_is_pin_required_on_launch"
    private static let KEY_ACTIVE_WALLET_ID = "key_active_wallet_id"
    private static let KEY_NIS_URL = "key_nis_url"

    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }

    var isFirstLaunch: Bool {
        get {
            if userDefaults.object(forKey: ApplicationSetting.KEY_IS_FIRST_LAUNCH) == nil {
                return true
            }
            return userDefaults.bool(forKey: ApplicationSetting.KEY_IS_FIRST_LAUNCH)
        }
        set {
            userDefaults.set(newValue, forKey: ApplicationSetting.KEY_IS_FIRST_LAUNCH)
        }
    }

    var isEnabledBiometry: Bool {
        get {
            if userDefaults.object(forKey: ApplicationSetting.KEY_IS_ENABLED_BIOMETRY) == nil {
                return false
            }
            return userDefaults.bool(forKey: ApplicationSetting.KEY_IS_ENABLED_BIOMETRY)
        }
        set {
            userDefaults.set(newValue, forKey: ApplicationSetting.KEY_IS_ENABLED_BIOMETRY)
        }
    }

    var isPinRequiredOnLaunch: Bool {
        get {
            if userDefaults.object(forKey: ApplicationSetting.KEY_IS_PIN_REQUIRED_ON_LAUNCH) == nil {
                return false
            }
            return userDefaults.bool(forKey: ApplicationSetting.KEY_IS_PIN_REQUIRED_ON_LAUNCH)
        }
        set {
            userDefaults.set(newValue, forKey: ApplicationSetting.KEY_IS_PIN_REQUIRED_ON_LAUNCH)
        }
    }

    var showsSendCaution: Bool {
        get {
            if userDefaults.object(forKey: ApplicationSetting.KEY_SHOWS_SEND_CAUTION) == nil {
                return true
            }
            return userDefaults.bool(forKey: ApplicationSetting.KEY_SHOWS_SEND_CAUTION)
        }
        set {
            userDefaults.set(newValue, forKey: ApplicationSetting.KEY_SHOWS_SEND_CAUTION)
        }
    }

    
    var activeWalletId: String? {
        get {
            if userDefaults.object(forKey: ApplicationSetting.KEY_ACTIVE_WALLET_ID) == nil {
                return nil
            }
            return userDefaults.string(forKey: ApplicationSetting.KEY_ACTIVE_WALLET_ID)
        }
        set {
            userDefaults.set(newValue, forKey: ApplicationSetting.KEY_ACTIVE_WALLET_ID)
        }
    }
    
    var nisUrl: String {
        get {
            return userDefaults.string(forKey: ApplicationSetting.KEY_NIS_URL) ?? "http://176.9.68.110:7890"
        }
        set {
            userDefaults.set(newValue, forKey: ApplicationSetting.KEY_NIS_URL)
            guard let url = URL(string: newValue) else {
                Logger.shared.error("Illegal URL string \(newValue)")
                return
            }
            NemSwiftConfiguration.defaultBaseURL = url
        }
    }
}
