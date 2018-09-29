//
//  UIntExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

extension UInt {
    func dateAsTimestamp() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")

        let genesisDate = dateFormatter.date(from: "2015/03/29 00:06:25")!

        return genesisDate.addingTimeInterval(Double(self))
    }
}
