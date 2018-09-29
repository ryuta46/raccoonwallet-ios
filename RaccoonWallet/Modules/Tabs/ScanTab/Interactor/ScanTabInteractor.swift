//
//  ScanTabInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class ScanTabInteractor: NemServiceInteractor, ScanTabUseCase {
    weak var output: ScanTabInteractorOutput!

    func fetchPublicKey(_ address: String) {
        fetchPublicKey(address, output)
    }

}
