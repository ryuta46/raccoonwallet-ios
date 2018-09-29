//
//  RateService.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

class RateService {

    static func getRate(currency: Currency) -> Single<Decimal> {
        return Single
            .zip(
                PoloniexService.returnTicker().map { tickers in tickers.BTC_XEM.last },
                BlockchainInfoService.ticker().map { tickers in tickers.JPY.last } // TODO: other local currency
            )
            .map { (btcXem, lcBtc) in btcXem * lcBtc }
    }
}
