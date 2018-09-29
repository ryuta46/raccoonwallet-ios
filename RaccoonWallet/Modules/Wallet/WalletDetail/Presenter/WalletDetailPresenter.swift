//
//  WalletDetailPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NemSwift

class WalletDetailPresenter : BasePresenter {
    weak var view: WalletDetailView?
    var interactor: WalletDetailUseCase!
    var router: WalletDetailWireframe!
    var wallet: Wallet!

    override func viewDidLoad() {
        view?.showWalletName(wallet)
        view?.showLoading()
        interactor.fetchAccount(wallet.address)
    }
}

extension WalletDetailPresenter : WalletDetailPresentation {
}

extension WalletDetailPresenter : WalletDetailInteractorOutput {
    func accountFetched(_ account: AccountMetaDataPair) {
        view?.showDetail(
                type: "WalletType : " + (account.isMultisig ? "Multisig" : "Standard"),
                structure: "\(account.account.multisigInfo?.minCosignatories ?? 0) of \(account.account.multisigInfo?.cosignatoriesCount ?? 0)",
                importance: "\(account.account.importance)",
                publicKey: "\(account.account.publicKey ?? R.string.localizable.common_not_get())")
    }

    func accountFetchFailed(_ error: Error) {
        view?.showDetail(type: "-", structure: "-",  importance: "-", publicKey: "-")
    }
}
