//
// Created by Taizo Kusuda on 2018/09/16.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class MessageDialogPreset {

    static func createErrorNotSetPin(handler: @escaping (MessageDialogResult) -> Void) -> UIViewController {
        return MessageDialogRouter.assembleModule(
                headline: R.string.localizable.common_error_go_send_title(),
                messages: [R.string.localizable.common_error_go_send_pin_message()],
                mode: .show,
                style: .caution,
                isCancelableOnTouchedOutside: true,
                okText: R.string.localizable.common_error_go_send_pin_button(),
                handler: handler)
    }

    static func createErrorNotSelectWallet(handler: @escaping (MessageDialogResult) -> Void) -> UIViewController {
        return MessageDialogRouter.assembleModule(
                headline: R.string.localizable.common_error_go_send_title(),
                messages: [R.string.localizable.common_error_go_send_no_wallet_message()],
                mode: .show,
                style: .caution,
                isCancelableOnTouchedOutside: true,
                okText: R.string.localizable.common_error_go_send_no_wallet_button(),
                handler: handler)
    }
}