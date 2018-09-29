//
// Created by Taizo Kusuda on 2018/09/13.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class NemNodesService {
    static let defaultURL = URL(string: "https://supernodes.nem.io")!
    static var baseURL = NemNodesService.defaultURL

    static func nodes() -> Single<[NemNode]> {
        class NemNodesRequest: DecodableGetRequest<NemNodes> {
            init(baseURL: URL) {
                super.init(baseURL: baseURL, path: "/nodes")
            }
        }

        return Session.rx_send(NemNodesRequest(baseURL: self.baseURL)).map { $0.nodes }
    }
}
