//
//  MosaicListContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol MosaicListView: BaseView {
    var presenter: MosaicListPresentation! { get set }

    func showLoading()
    func hideLoading()
    func showEmpty()
    func showMosaics(_ mosaics: [MosaicImageUrl])
    func showMosaicDetail(_ mosaic: MosaicImageUrl)
}

//sourcery: AutoMockable
protocol MosaicListPresentation: BasePresentation {
    var view: MosaicListView? { get set }
    var interactor: MosaicListUseCase! { get set }
    var router: MosaicListWireframe! { get set }

    func didClickMosaic(_ mosaic: MosaicImageUrl)
}

//sourcery: AutoMockable
protocol MosaicListUseCase: class {
    var output: MosaicListInteractorOutput! { get set }

    func fetchMosaicOwned(_ address: String)
    func fetchXEMBookMosaicList()
}

//sourcery: AutoMockable
protocol MosaicListInteractorOutput: NemServiceMosaicOwnedOutput {
    func mosaicListFetched(_ mosaics: [MosaicImageUrl])
    func mosaicListFetchFailed(_ error: Error)
}

//sourcery: AutoMockable
protocol MosaicListWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}
