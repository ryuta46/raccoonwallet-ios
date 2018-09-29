//
//  SendModePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class SendModePresenter: BasePresenter {
    weak var view: SendModeView?
    var interactor: SendModeUseCase!
    var router: SendModeWireframe!
    var sendTransaction: SendTransaction!
}

extension SendModePresenter: SendModePresentation {
    func didClickStandard() {
        router.presentSendConfirmation(sendTransaction)
    }

    func didClickMessage() {
        router.presentSendMessageType(sendTransaction)
    }
}

extension SendModePresenter: SendModeInteractorOutput {
}
