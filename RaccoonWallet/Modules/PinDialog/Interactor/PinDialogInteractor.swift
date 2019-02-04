//
//  PinDialogInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class PinDialogInteractor: PinDialogUseCase {
    weak var output: PinDialogInteractorOutput!

    func validateCode(_ pin: String) {
        DispatchQueue.global().async { [weak self] in
            let result = PinPreference.shared.verify(pin)
            DispatchQueue.main.async {
                self?.output.pinValidated(result, pin)
            }
        }
    }

    func registerCode(_ oldCode: String, _ newCode: String) {
        DispatchQueue.global().async { [weak self] in
            do {
                let storage = WalletStorage()
                let wallets = storage.all
                try wallets.forEach { try WalletHelper.reencryptWallet($0, oldPassword: oldCode, newPassword: newCode)}
                try PinPreference.shared.save(newCode)

                storage.update(wallets)

                DispatchQueue.main.async {
                    self?.output.pinRegistered(true, newCode)
                }
            } catch {
                DispatchQueue.main.async {
                    self?.output.pinRegistered(false, newCode)
                }
            }
        }
    }

}
