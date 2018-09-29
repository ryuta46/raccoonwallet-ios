//
//  TopContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

protocol TopView: class {
    var presenter: TopPresentation! { get set }

    func showDrawer()
    func showHome()
}

protocol TopPresentation: class {
    var view: TopView? { get set }
    var interactor: TopUseCase! { get set }

    func viewDidLoad()
    func didClickMenu()
}

protocol TopUseCase: class {
    var output: TopInteractorOutput! { get set }
}

protocol TopInteractorOutput: class {
}

protocol TopWireframe: class {
}
