//
// Created by Taizo Kusuda on 2018/09/14.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class XEMBookService {
    static let defaultURL = URL(string: "https://s3-ap-northeast-1.amazonaws.com/")!
    static var baseURL = XEMBookService.defaultURL

    static func mosaicList() -> Single<[MosaicImageUrl]> {
        class XEMBookMosaicListRequest: DecodableGetRequest<[MosaicImageUrl]> {
            init(baseURL: URL) {
                super.init(baseURL: baseURL, path: "/xembook.net/gallery/mosaic_list.json")
            }
        }

        return Session.rx_send(XEMBookMosaicListRequest(baseURL: self.baseURL))
    }

    static func activeNodeList() -> Single<ActiveNodeList> {
        class XEMBookMosaicListRequest: DecodableGetRequest<ActiveNodeList> {
            init(baseURL: URL) {
                super.init(baseURL: baseURL, path: "/xembook.net/data/v3/node.json")
            }
        }

        return Session.rx_send(XEMBookMosaicListRequest(baseURL: self.baseURL))
    }

}

