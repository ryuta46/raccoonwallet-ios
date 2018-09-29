//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit


protocol PinDialogMixinView: class {
    func showPinDialog(presenter: PinDialogMixinPresentation)
    func showPinDialog(forRegistration: Bool,presenter: PinDialogMixinPresentation)
    func showPinDialog(forRegistration: Bool, cancelable: Bool, presenter: PinDialogMixinPresentation)
}

protocol PinDialogMixinViewController: PinDialogMixinView {
}

extension PinDialogMixinViewController where Self: UIViewController{
    func showPinDialog(presenter: PinDialogMixinPresentation) {
        showPinDialog(forRegistration: false, cancelable: true, presenter: presenter)
    }
    func showPinDialog(forRegistration: Bool, presenter: PinDialogMixinPresentation) {
        showPinDialog(forRegistration: forRegistration, cancelable: true, presenter: presenter)

    }
    func showPinDialog(forRegistration: Bool, cancelable: Bool, presenter: PinDialogMixinPresentation) {
        let dialog = PinDialogRouter.assembleModule(forRegistration: forRegistration, cancelable: cancelable) { pin in
            if let pin = pin {
                if forRegistration {
                    presenter.didRegisterPin(pin)
                } else {
                    presenter.didValidatePin(pin)
                }
            } else {
                presenter.didCancelPin()
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}

