//
//  WalletSettingInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

class WalletSettingInteractor: NemServiceInteractor, WalletSettingUseCase {
    weak var output: WalletSettingInteractorOutput!

    func fetchAccount(_ address: String) {
        fetchAccount(address, output)
    }

}
