//
//  SendTabInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/02
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift
import NemSwift

class SendTabInteractor: NemServiceInteractor, SendTabUseCase {
    weak var output: SendTabInteractorOutput!

    func fetchPublicKey(_ address: String) {
        fetchPublicKey(address, output)
    }

    func fetchNamespace(_ address: String) {
        fetchNamespace(address, output)
    }
}
