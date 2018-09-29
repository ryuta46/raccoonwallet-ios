//
//  WalletImportEndPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletImportEndPresenter: BasePresenter {
    weak var view: WalletImportEndView?
    var interactor: WalletImportEndUseCase!
    var router: WalletImportEndWireframe!
}

extension WalletImportEndPresenter: WalletImportEndPresentation {
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

extension WalletImportEndPresenter : WalletImportEndInteractorOutput {
    
}
