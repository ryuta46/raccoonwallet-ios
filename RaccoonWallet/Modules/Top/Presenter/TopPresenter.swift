//
//  TopPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class TopPresenter: TopPresentation {
    weak var view: TopView?
    var interactor: TopUseCase!
    var router: TopWireframe!

    func viewDidLoad() {
        view?.showHome()
    }

    func didClickMenu() {
        view?.showDrawer()
    }
}

extension TopPresenter: TopInteractorOutput {

}
