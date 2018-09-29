//
//  SendEndPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class SendEndPresenter: BasePresenter {
    weak var view: SendEndView?
    var interactor: SendEndUseCase!
    var router: SendEndWireframe!
}

extension SendEndPresenter: SendEndPresentation {
    func didClickHome() {
        router.goBackHome()
    }

    func didClickTransaction() {
        router.presentTransaction()
    }
}

extension SendEndPresenter: SendEndInteractorOutput {
}
