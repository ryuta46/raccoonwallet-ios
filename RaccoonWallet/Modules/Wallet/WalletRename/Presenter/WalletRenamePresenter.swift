//
//  WalletRenamePresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class WalletRenamePresenter: BasePresenter {
    weak var view: WalletRenameView?
    var interactor: WalletRenameUseCase!
    var router: WalletRenameWireframe!
    var handler: ((String?) -> Void)?
    var name: String = ""

    override func viewDidLoad() {
        view?.disableOk()
    }
}

extension WalletRenamePresenter: WalletRenamePresentation {
    func didClickOk() {
        router.dismiss(name, handler)
    }

    func didClickCancel() {
        router.dismiss(nil, handler)
    }

    func didChangeName(_ name: String) {
        self.name = name
        if name.count > 0 {
            view?.enableOk()
        } else {
            view?.disableOk()
        }
    }
}

extension WalletRenamePresenter : WalletRenameInteractorOutput {
    
}
