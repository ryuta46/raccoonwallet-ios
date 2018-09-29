//
//  MessageDialogRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class MessageDialogRouter: MessageDialogWireframe {
    weak var viewController: UIViewController?

    static func assembleModule(headline: String,
                               messages: [String],
                               mode: MessageDialogMode = .show,
                               style: MessageDialogStyle = .normal,
                               isCancelableOnTouchedOutside: Bool = false,
                               okText: String = "OK",
                               handler: ((MessageDialogResult) -> Void)? = nil
                               ) -> UIViewController {
        let view = R.storyboard.messageDialogStoryboard.messageDialogView()!
        let presenter = MessageDialogPresenter()
        let interactor = MessageDialogInteractor()
        let router = MessageDialogRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.headline = headline
        presenter.messages = messages
        presenter.mode = mode
        presenter.style = style
        presenter.isCancelableOnTouchedOutside = isCancelableOnTouchedOutside
        presenter.okText = okText
        presenter.handler = handler
        interactor.output = presenter
        
        router.viewController = view
        return view

    }
    
    func dismiss(result: MessageDialogResult, handler: ((MessageDialogResult) -> Void)?) {
        viewController?.dismiss(animated: true, completion: {
            handler?(result)
        })
    }
   
}

