//
//  LocalAuthenticationHelper.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/24.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import LocalAuthentication

enum BiometryType {
    case none
    case touchID
    case faceID

    var description: String {
        switch self {
        case .none: return "NONE"
        case .touchID: return R.string.localizable.common_touchID()
        case .faceID: return R.string.localizable.common_faceID()
        }
    }
}

class LocalAuthenticationHelper {
    static func checkBiometrics() -> BiometryType {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if #available(iOS 11.0, *) {
                switch context.biometryType {
                case .none: return .none
                case .touchID: return .touchID
                case .faceID: return .faceID
                }
            } else {
                return .touchID
            }
        } else {
            return .none
        }

    }
}