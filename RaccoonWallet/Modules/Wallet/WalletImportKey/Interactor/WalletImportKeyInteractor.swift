//
//  WalletImportKeyInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class WalletImportKeyInteractor: WalletImportKeyUseCase {
    weak var output: WalletImportKeyInteractorOutput!

    func repairWallet(key: String, pin: String) {
        let defaultWalletName = "Imported"
        if ConvertUtil.toByteArray(key).count == Constant.privateKeyLength {
            do {
                let wallet = try WalletHelper.createWallet(name: defaultWalletName, password: pin, importKey: key)
                WalletStorage.shared.add(wallet)
                ApplicationSetting.shared.activeWalletId = wallet.id
                output.walletRepaired(wallet: wallet)
            } catch {
                output.walletRepairFailed()
            }
        } else {
            output.walletRepairFailed()
        }
    }

    func repairWalletQr(from qr: WalletQr, password: String, pin: String) {
        do {
            let decryptedKey = try WalletHelper.decryptKey(qr.data.priv_key, salt: qr.data.salt, password: password).normalizePrivateKey()
            if ConvertUtil.toByteArray(decryptedKey).count != Constant.privateKeyLength {
                // invalid password
                output.walletQrRepairFailed()
                return
            }
            do {
                let wallet = try WalletHelper.createWallet(name: qr.data.name, password: pin, importKey: decryptedKey)
                WalletStorage.shared.add(wallet)
                ApplicationSetting.shared.activeWalletId = wallet.id
                output.walletQrRepaired(wallet: wallet)
            } catch {
                // invalid private key
                output.walletRepairFailed()
            }
        } catch {
            // invalid password
            output.walletQrRepairFailed()
        }
    }
}
