//
//  WalletBackupInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletBackupInteractor: WalletBackupUseCase {
    weak var output: WalletBackupInteractorOutput!

    func decryptPrivateKey(_ wallet: Wallet, pin: String) {
        do {
            let account = try WalletHelper.repairAccount(from: wallet, password: pin)
            output.privateKeyDecrypted(account.keyPair.importKey())
        } catch {
            output.privateKeyDecryptFailed()
        }
    }
}
