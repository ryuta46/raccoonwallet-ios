//
//  QrLabTabPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class QrLabTabPresenter: BasePresenter {
    weak var view: QrLabTabView?
    var interactor: QrLabTabUseCase!
    var router: QrLabTabWireframe!
}

extension QrLabTabPresenter: QrLabTabPresentation {
    func didClickAmount() {
        router.presentAmount()
    }

    func didClickList() {
        view?.showInfo(R.string.localizable.common_coming_soon())
    }

    func didClickRegister() {
        view?.showInfo(R.string.localizable.common_coming_soon())
    }
}

extension QrLabTabPresenter: QrLabTabInteractorOutput {
    
}
