//
//  MosaicListInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class MosaicListInteractor: NemServiceInteractor, MosaicListUseCase {
    weak var output: MosaicListInteractorOutput!

    func fetchMosaicOwned(_ address: String) {
        fetchMosaicOwned(address, output, noUseCache: true)
    }

    func fetchXEMBookMosaicList() {
        XEMBookService
                .mosaicList()
                .subscribe(
                        onSuccess: { mosaics in self.output.mosaicListFetched(mosaics)},
                        onError: { error in self.output.mosaicListFetchFailed(error) }
                )
                .disposed(by: disposeBag)
    }
}
