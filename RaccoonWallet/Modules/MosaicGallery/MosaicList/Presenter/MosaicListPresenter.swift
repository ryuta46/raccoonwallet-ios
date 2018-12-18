//
//  MosaicListPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class MosaicListPresenter: BasePresenter {
    weak var view: MosaicListView?
    var interactor: MosaicListUseCase!
    var router: MosaicListWireframe!

    var ownedMosaics: [MosaicDetail]? = nil
    var xemBookImages: [MosaicImageUrl]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        if let wallet = WalletHelper.activeWallet {
            view?.showLoading()

            interactor.fetchXEMBookMosaicList()
            interactor.fetchMosaicOwned(wallet.address)
        }
        else {
            view?.showError(R.string.localizable.wallet_not_select_message())
        }
    }
}

extension MosaicListPresenter: MosaicListPresentation {
    func didClickMosaic(_ mosaic: MosaicImageUrl) {
        view?.showMosaicDetail(mosaic)
    }

    private func updateMosaicListView() {
        guard let mosaicImages = getOwnedMosaicImages() else {
            // loading owned mosaics or xem book url
            return
        }
        view?.hideLoading()
        if mosaicImages.isEmpty {
            view?.showEmpty()
        } else {
            view?.showMosaics(mosaicImages)
        }
    }

    private func getOwnedMosaicImages() -> [MosaicImageUrl]? {
        guard let ownedMosaics = self.ownedMosaics, let xemBookImages = self.xemBookImages else {
            return nil
        }

        return ownedMosaics.compactMap { mosaic in
            if let xemBookImageUrl = xemBookImages.first(where: { $0.identifier == mosaic.identifier }) {
                // for xem book image
                return xemBookImageUrl
            } else if let description = mosaic.description, description.contains(Constant.oaMosaicImageKey) {
                // for open apostille image
                let imageName = description.replacingOccurrences(of: Constant.oaMosaicImageKey, with: "")
                return MosaicImageUrl(
                        namespace: mosaic.namespace,
                        name: mosaic.mosaic,
                        url: Constant.oaMosaicImagePrefix + imageName + Constant.oaMosaicImageSuffix)
            } else {
                return nil
            }
        }
    }

}

extension MosaicListPresenter: MosaicListInteractorOutput {
    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        ownedMosaics = mosaics
        updateMosaicListView()
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(R.string.localizable.common_error_network())
    }

    func mosaicListFetched(_ mosaics: [MosaicImageUrl]) {
        xemBookImages = mosaics
        updateMosaicListView()
    }

    func mosaicListFetchFailed(_ error: Error) {
        view?.hideLoading()
        view?.showError(R.string.localizable.common_error_network())
    }
}
