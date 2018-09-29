//
//  SendMessageTypePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class SendMessageTypePresenter: BasePresenter {
    weak var view: SendMessageTypeView?
    var interactor: SendMessageTypeUseCase!
    var router: SendMessageTypeWireframe!
    var sendTransaction: SendTransaction!
}

extension SendMessageTypePresenter: SendMessageTypePresentation {
    func didClickStandard() {
        sendTransaction.messageType = .plain
        view?.showMessageInputDialog()
    }

    func didClickEncryption() {
        sendTransaction.messageType = .secure
        view?.showMessageInputDialog()
    }

    func didConfirmMessage(_ message: String) {
        sendTransaction.message = message
        router.presentSendConfirmation(sendTransaction)
    }
}

extension SendMessageTypePresenter: SendMessageTypeInteractorOutput {
}
