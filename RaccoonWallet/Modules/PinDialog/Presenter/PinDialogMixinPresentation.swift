//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

protocol PinDialogMixinPresentation: class {
    func didRegisterPin(_ pin: String)
    func didValidatePin(_ pin: String)
    func didCancelPin()
}
extension PinDialogMixinPresentation {
    func didRegisterPin(_ pin: String) {
    }

    func didValidatePin(_ pin: String) {
    }

    func didCancelPin() {
    }
}