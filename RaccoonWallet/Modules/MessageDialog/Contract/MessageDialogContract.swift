//
//  MessageDialogContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


enum MessageDialogMode {
    case show // only ok button
    case selectable // ok and cancel
    case neverRemind // ok and never remind
}

enum MessageDialogStyle {
    case normal
    case caution
    case success
    case biometrics
}

enum MessageDialogResult {
    case ok // ok
    case cancel // cancel or press outside of dialog
    case neverRemind // ok with no
}

protocol MessageDialogView: BaseView {
    var presenter: MessageDialogPresentation! { get set }
    
    func showHeadline(_ headline: String)
    func showMessage(_ messages: [String])
    func showOk(text: String, color: UIColor)
    func showHeader(icon: UIImage, background: UIColor)
    func showActions(_ mode: MessageDialogMode)
}

protocol MessageDialogPresentation: BasePresentation {
    var view: MessageDialogView? { get set }
    var interactor: MessageDialogUseCase! { get set }
    var router: MessageDialogWireframe! { get set }
    
    func didClickOutside()
    func didClickOk()
    func didClickCancel()
    func didClickNeverRemind()
}

protocol MessageDialogUseCase: class {
    var output: MessageDialogInteractorOutput! { get set }
}

protocol MessageDialogInteractorOutput: class {
}

protocol MessageDialogWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(headline: String,
                               messages: [String],
                               mode: MessageDialogMode,
                               style: MessageDialogStyle,
                               isCancelableOnTouchedOutside: Bool,
                               okText: String,
                               handler: ((MessageDialogResult) -> Void)?
                               ) -> UIViewController
    
    func dismiss(result: MessageDialogResult, handler: ((MessageDialogResult) -> Void)?)
}
