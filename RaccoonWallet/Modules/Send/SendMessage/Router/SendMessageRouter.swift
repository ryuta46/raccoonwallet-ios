//
//  SendMessageRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class SendMessageRouter: SendMessageWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ handler: ((String?) -> Void)?) -> UIViewController {
        let view = R.storyboard.sendMessageStoryboard.sendMessageView()!
        let presenter = SendMessagePresenter()
        let interactor = SendMessageInteractor()
        let router = SendMessageRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.handler = handler
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss(_ message: String?, _ handler: ((String?) -> Void)?) {
        viewController?.dismiss(animated: true) {
            handler?(message)
        }
    }
}

