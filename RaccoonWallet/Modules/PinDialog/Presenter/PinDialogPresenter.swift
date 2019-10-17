//
//  PinDialogPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class PinDialogPresenter : BasePresenter {
    private static let PIN_LENGTH = 6
    weak var view: PinDialogView?
    var interactor: PinDialogUseCase!
    var router: PinDialogWireframe!
    var handler: ((String?) -> Void)?
    var isRegisterMode: Bool!
    var cancelable: Bool!
    var message: String?

    var pin: String = ""
    var pinCache: String = ""
    var oldPin: String = ""

    enum State {
        case check
        case registration
        case confirmation
    }
    var state: State = .check

    override func viewDidLoad() {
        if !cancelable {
            view?.hideCancel()
        }

        if PinPreference.shared.saved {
            state = .check
            view?.showMessage(message ?? "Check PIN")

            if ApplicationSetting.shared.isEnabledBiometry {
                PinPreference.shared.getForBiometrics(
                        onSuccess: { pin in
                            self.pin = String(pin.prefix(PinDialogPresenter.PIN_LENGTH))
                            DispatchQueue.main.async {
                                self.proceed()
                            }
                        },
                        onError: { error in
                            // only disappear biometrics dialog
                        }
                )
            }
        } else {
            state = .registration
            oldPin = PinPreference.DEFAULT_PIN

            view?.showMessage(message ?? "Enter PIN")
            DispatchQueue.main.async {
                self.view?.showRegistrationMessage()
            }
        }
    }
}

extension PinDialogPresenter : PinDialogPresentation {
    func didClickNumber(_ number: Int) {
        if (pin.count < PinDialogPresenter.PIN_LENGTH) {
            pin += String(number)
            proceed()
        }
    }
    func didClickCancel() {
        router.dismiss(pin: nil, handler)
    }

    private func proceed() {
        view?.showInputted(pin.count)
        if pin.count == PinDialogPresenter.PIN_LENGTH {
            switch state {
            case .check:
                interactor.validateCode(pin)
            case .registration:
                pinCache = pin
                pin = ""
                state = .confirmation
                view?.showMessage(message ?? "Confirm PIN")
                view?.showInputted(pin.count)
            case .confirmation:
                if pin == pinCache {
                    interactor.registerCode(oldPin, pin)
                } else {
                    // retry
                    pin = ""
                    view?.showResult(false)
                    view?.showInputted(pin.count)
                }
            }
        }
    }


}

extension PinDialogPresenter : PinDialogInteractorOutput {
    func pinValidated(_ result: Bool) {
        view?.showResult(result)

        if result {
            if isRegisterMode {
                state = .registration
                oldPin = pin
                pin = ""

                view?.showInputted(pin.count)
                view?.showMessage(message ?? "Enter PIN")
                view?.showRegistrationMessage()

            } else {
                router.dismiss(pin: pin, handler)
            }
        } else {
            pin = ""
            view?.showInputted(pin.count)
        }
    }

    func pinRegistered(_ result: Bool) {
        if result {
            router.dismiss(pin: pin, handler)
        } else {
            router.dismiss(pin: nil, handler)
        }
    }
}
