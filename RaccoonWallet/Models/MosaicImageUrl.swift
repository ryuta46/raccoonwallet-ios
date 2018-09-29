//
// Created by Taizo Kusuda on 2018/09/14.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

struct MosaicImageUrl: Codable {
    let namespace: String
    let name: String
    let url: String

    var identifier: String {
        return namespace + ":" + name
    }
}