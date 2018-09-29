//
//  BlockchainInfoService.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class BlockchainInfoService {
    static let defaultURL = URL(string: "https://blockchain.info")!
    static var baseURL = BlockchainInfoService.defaultURL

    static func ticker() -> Single<BlockchainInfoTickers> {
        class BlockchainInfoTickerRequest: DecodableGetRequest<BlockchainInfoTickers> {
            init(baseURL: URL) {
                super.init(baseURL: baseURL, path: "/ticker")
            }
        }
        return Session.rx_send(BlockchainInfoTickerRequest(baseURL: self.baseURL))
    }

}
