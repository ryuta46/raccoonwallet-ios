//
//  MessageDialogPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class MessageDialogPresenter : BasePresenter {
    weak var view: MessageDialogView?
    var interactor: MessageDialogUseCase!
    var router: MessageDialogWireframe!

    var headline: String!
    var messages: [String]!
    var mode: MessageDialogMode!
    var handler: ((MessageDialogResult) -> Void)?
    var style: MessageDialogStyle!
    var isCancelableOnTouchedOutside: Bool!
    var okText: String!

    override func viewDidLoad() {
        let icon: UIImage
        let color: UIColor
        if style == .caution {
            icon = R.image.icon_dialog_error()!
            color = Theme.caution
        }
        else {
            icon = R.image.logo_pyoko()!
            color = Theme.primary
        }

        view?.showHeader(icon: icon, background: color)
        view?.showOk(text: okText, color: color)
        view?.showHeadline(headline)
        view?.showMessage(messages)
        view?.showActions(mode)
    }
}

extension MessageDialogPresenter : MessageDialogPresentation {
    func didClickOutside() {
        if isCancelableOnTouchedOutside {
            router.dismiss(result: .cancel, handler: handler)
        }
    }
    
    func didClickOk() {
        router.dismiss(result: .ok, handler: handler)
    }
    func didClickCancel() {
        router.dismiss(result: .cancel, handler: handler)
    }

    func didClickNeverRemind() {
        router.dismiss(result: .neverRemind, handler: handler)
    }

}

extension MessageDialogPresenter : MessageDialogInteractorOutput {
    
}
