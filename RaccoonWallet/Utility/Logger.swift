//
//  Logger.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCGLogger

class Logger {
    static var shared: XCGLogger!
    static func setup() {
        shared = XCGLogger.default
        shared.setup(level: .debug,
                     showLogIdentifier: true,
                     showFunctionName: true,
                     showThreadName: true,
                     showLevel: true,
                     showFileNames: true,
                     showLineNumbers: true,
                     showDate: true,
                     writeToFile: nil,
                     fileLevel: nil)
    }
   
   
}
