//
//  WalletNewEndContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletNewEndView: BaseView {
    var presenter: WalletNewEndPresentation! { get set }

    func showHomeCaution1()
    func showHomeCaution2()
}

protocol WalletNewEndPresentation: BasePresentation {
    var view: WalletNewEndView? { get set }
    var interactor: WalletNewEndUseCase! { get set }
    var router: WalletNewEndWireframe! { get set }
    
    func didClickLesson()
    func didClickHome()
    func didClickHomeCautionOk1()
    func didClickHomeCautionOk2()
}

protocol WalletNewEndUseCase: class {
    var output: WalletNewEndInteractorOutput! { get set }
}

protocol WalletNewEndInteractorOutput: class {
}

protocol WalletNewEndWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
    
    func presentLesson()
    func goBackHome()
}
