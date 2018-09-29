//
//  WalletNewEndPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletNewEndPresenter: BasePresenter {
    weak var view: WalletNewEndView?
    var interactor: WalletNewEndUseCase!
    var router: WalletNewEndWireframe!
}

extension WalletNewEndPresenter: WalletNewEndPresentation {
    func didClickLesson() {
        router.presentLesson()
    }

    func didClickHome() {
        if PinPreference.shared.saved {
            router.goBackHome()
        } else {
            view?.showHomeCaution1()
        }
    }

    func didClickHomeCautionOk1() {
        view?.showHomeCaution2()
    }

    func didClickHomeCautionOk2() {
        router.goBackHome()
    }
}

extension WalletNewEndPresenter: WalletNewEndInteractorOutput {
    
}
