//
//  ActiveNodeList.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2019/02/27.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//


import Foundation

struct ActiveNodeList: Codable {
    let http: [String]
    let https: [String]
}