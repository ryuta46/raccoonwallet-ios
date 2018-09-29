//
//  DateExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

extension Date {
    func format(_ description: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = description

        return dateFormatter.string(from: self)
    }

    var dateString: String {
        return format("MM/dd yyyy")
    }

    var timeInDayString: String {
        return format("HH:mm:ss")
    }
    var dateTimeString: String {
        return format("MM/dd yyyy HH:mm:ss")
    }
}
