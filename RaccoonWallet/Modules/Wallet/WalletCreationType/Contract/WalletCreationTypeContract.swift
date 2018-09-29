//
//  WalletCreationTypeContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/19
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

protocol WalletCreationTypeView: BaseView {
    var presenter: WalletCreationTypePresentation! { get set }
}

protocol WalletCreationTypePresentation: BasePresentation {
    var view: WalletCreationTypeView? { get set }
    var interactor: WalletCreationTypeUseCase! { get set }
    var router: WalletCreationTypeWireframe! { get set }

    func didClickNew()
    func didClickImport()
}

protocol WalletCreationTypeUseCase: class {
    var output: WalletCreationTypeInteractorOutput! { get set }
}

protocol WalletCreationTypeInteractorOutput: class {
}

protocol WalletCreationTypeWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentCreationNew()
    func presentCreationImport()
}
