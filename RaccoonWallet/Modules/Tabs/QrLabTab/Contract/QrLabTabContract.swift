//
//  QrLabTabContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


protocol QrLabTabView: BaseView {
    var presenter: QrLabTabPresentation! { get set }
}

protocol QrLabTabPresentation: BasePresentation {
    var view: QrLabTabView? { get set }
    var interactor: QrLabTabUseCase! { get set }
    var router: QrLabTabWireframe! { get set }
    
    func didClickAmount()
    func didClickList()
    func didClickRegister()
}

protocol QrLabTabUseCase: class {
    var output: QrLabTabInteractorOutput! { get set }
}

protocol QrLabTabInteractorOutput: class {
}

protocol QrLabTabWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentAmount()
}
