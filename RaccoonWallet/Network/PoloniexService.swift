//
//  PoloniexService.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import APIKit
import RxSwift

class PoloniexService {
    static let defaultURL = URL(string: "https://poloniex.com")!
    static var baseURL = PoloniexService.defaultURL

    static func returnTicker() -> Single<PoloniexTickers> {
        class PoloniexTickerRequest: DecodableGetRequest<PoloniexTickers> {
            init(baseURL: URL) {
                super.init(baseURL: baseURL, path: "/public", queryParameters: ["command": "returnTicker"])
            }
        }

        return Session.rx_send(PoloniexTickerRequest(baseURL: self.baseURL))
    }
}
