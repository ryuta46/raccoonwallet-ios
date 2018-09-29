//
//  SendMessagePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class SendMessagePresenter: BasePresenter {
    weak var view: SendMessageView?
    var interactor: SendMessageUseCase!
    var router: SendMessageWireframe!
    var message: String = ""
    var messageLengthDescription: String {
        return "\(message.utf8.count) / \(Constant.messageMaxLength)"
    }

    var handler: ((String?) -> Void)?

    override func viewDidLoad() {
        view?.showTitle(messageLengthDescription)
        view?.disableOk()
    }
}

extension SendMessagePresenter: SendMessagePresentation {
    func didClickOk() {
        router.dismiss(message, handler)
    }

    func didClickCancel() {
        router.dismiss(nil, handler)
    }

    func didChangeMessage(_ message: String) {
        self.message = message
        if !message.isEmpty && message.utf8.count <= Constant.messageMaxLength {
            view?.enableOk()
        }  else {
            view?.disableOk()
        }
        view?.showTitle(messageLengthDescription)
    }
}

extension SendMessagePresenter: SendMessageInteractorOutput {
}
