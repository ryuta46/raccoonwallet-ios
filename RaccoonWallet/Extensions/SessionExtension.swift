//
//  SessionExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import APIKit
import RxSwift
import Result

extension Session {
    func rx_send<T: Request>(_ request: T) -> Single<T.Response> {
        return Single.create { observer in
            let task = self.send(request) { result in
                switch result {
                case .success(let res):
                    observer(.success(res))
                case .failure(let err):
                    observer(.error(err))
                }
            }
            return Disposables.create {
                task?.cancel()
            }
        }
    }
    class func rx_send<T: Request>(_ request: T) -> Single<T.Response> {
        return shared.rx_send(request)
    }
}
