//
//  PinDialogRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class PinDialogRouter: PinDialogWireframe {
    weak var viewController: UIViewController?

    static func assembleModule(
        forRegistration: Bool,
        cancelable: Bool = true,
        message: String? = nil,
        handler: ((String?) -> Void)? = nil) -> UIViewController {
        let view = R.storyboard.pinDialogStoryboard.pinDialogView()!
        let presenter = PinDialogPresenter()
        let interactor = PinDialogInteractor()
        let router = PinDialogRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.handler = handler
        presenter.isRegisterMode = forRegistration
        presenter.cancelable = cancelable
        presenter.message = message
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss(pin: String?, _ handler: ((String?) -> Void)?) {
        viewController?.dismiss(animated: true) {
            handler?(pin)
        }
    }

}

