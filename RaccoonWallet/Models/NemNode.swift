//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

struct NemNode: Codable {
    let ip: String
    let nisPort: Int

    var urlString: String {
        return "http://\(ip):\(nisPort)"
    }
}

struct NemNodes: Codable {
    let nodes: [NemNode]
}