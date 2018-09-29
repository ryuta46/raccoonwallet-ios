//
// Created by Taizo Kusuda on 2018/09/04.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

protocol RateServiceInteractorOutput: class {
    func rateFetched(_ rate: Decimal)
    func rateFetchFailed(_ error: Error)
}


protocol RateServiceUseCase {
    var disposeBag: DisposeBag { get }
}

//extension RateServiceUseCase where Self: RxDisposable {
extension RateServiceUseCase {

    func fetchRate(_ currency: Currency, _ output: RateServiceInteractorOutput) {
        RateService
                .getRate(currency: currency)
                .subscribe(
                        onSuccess: { rate in output.rateFetched(rate) },
                        onError: { error in output.rateFetchFailed(error) }
                )
                .disposed(by: disposeBag)
    }

}

class RateServiceInteractor: RxDisposable, RateServiceUseCase {

}