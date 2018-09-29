//
// Created by Taizo Kusuda on 2018/09/08.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

extension NemAnnounceResult {
    var isSuccess: Bool {
        return type == 1 && code == 1
    }
    var isInsufficientBalance: Bool {
        return type == 1 && code == 5
    }
}