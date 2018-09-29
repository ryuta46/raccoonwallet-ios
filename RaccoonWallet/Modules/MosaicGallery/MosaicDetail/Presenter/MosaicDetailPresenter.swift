//
//  MosaicDetailPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class MosaicDetailPresenter: BasePresenter {
    weak var view: MosaicDetailView?
    var interactor: MosaicDetailUseCase!
    var router: MosaicDetailWireframe!
    var mosaic: MosaicImageUrl!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: mosaic.url) {
            view?.showImage(url)
        }
        view?.showText(mosaic.namespace, mosaic.name)
    }
}

extension MosaicDetailPresenter: MosaicDetailPresentation {
    func didClickOutside() {
        router.dismiss()
    }
}

extension MosaicDetailPresenter: MosaicDetailInteractorOutput {
}
