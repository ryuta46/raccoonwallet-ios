//
//  NemConfiguration.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

enum Network {
    case testnet
    case mainnet
}

class NemConfiguration {

    static let network: Network = .mainnet

    static var addressNetwork: Address.Network {
        switch network {
        case .testnet: return .testnet
        case .mainnet: return .mainnet
        }
    }

    static var transactionNetwork: TransactionHelper.Network {
        switch network {
        case .testnet: return .testnet
        case .mainnet: return .mainnet
        }
    }

}
