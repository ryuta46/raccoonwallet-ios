//
//  WalletImportEndContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol WalletImportEndView: BaseView {
    var presenter: WalletImportEndPresentation! { get set }

    func showHomeCaution1()
    func showHomeCaution2()
}

protocol WalletImportEndPresentation: BasePresentation {
    var view: WalletImportEndView? { get set }
    var interactor: WalletImportEndUseCase! { get set }
    var router: WalletImportEndWireframe! { get set }
    
    func didClickLesson()
    func didClickHome()
    func didClickHomeCautionOk1()
    func didClickHomeCautionOk2()
}

protocol WalletImportEndUseCase: class {
    var output: WalletImportEndInteractorOutput! { get set }
}

protocol WalletImportEndInteractorOutput: class {
}

protocol WalletImportEndWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentLesson()
    func goBackHome()
}
