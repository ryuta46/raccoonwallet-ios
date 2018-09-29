//
//  SendTabContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/02
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol SendTabView: BaseView {
    var presenter: SendTabPresentation! { get set }

    func setDestination(_ destination: String)
    func showPaste()
    func showClear()
    func showOk()
    func showLoading()
    func showNewbieDialog()

    func showNotSetPinError()
    func showNotSelectWalletError()
}

protocol SendTabPresentation: BasePresentation {
    var view: SendTabView? { get set }
    var interactor: SendTabUseCase! { get set }
    var router: SendTabWireframe! { get set }
    
    func didChangeDestination(_ destination: String)
    func didClickPaste()
    func didClickClear()
    func didClickOk()
    func didClickNewbieOk()

    func didClickGoPinSetting()
    func didClickGoWalletSelect()
}

protocol SendTabUseCase: class {
    var output: SendTabInteractorOutput! { get set }

    func fetchPublicKey(_ address: String)
}

protocol SendTabInteractorOutput: NemServicePublicKeyOutput {
}

protocol SendTabWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentSendAmount(destination: String, destinationPublicKey: String?)

    func presentSetting()
    func presentWalletSelect()
}
