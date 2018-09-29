//
//  ReceiveTabContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/01
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol ReceiveTabView: BaseView {
    var presenter: ReceiveTabPresentation! { get set }

    func showAddress(_ address: String)
    func showQr(_ walletAddressQrJson: String)
    func hideQr()
}

protocol ReceiveTabPresentation: BasePresentation {
    var view: ReceiveTabView? { get set }
    var interactor: ReceiveTabUseCase! { get set }
    var router: ReceiveTabWireframe! { get set }
}

protocol ReceiveTabUseCase: class {
    var output: ReceiveTabInteractorOutput! { get set }
}

protocol ReceiveTabInteractorOutput: class {
}

protocol ReceiveTabWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}
