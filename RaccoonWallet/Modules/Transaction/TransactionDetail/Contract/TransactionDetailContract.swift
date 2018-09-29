//
//  TransactionDetailContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol TransactionDetailView: BaseView, PinDialogMixinView {
    var presenter: TransactionDetailPresentation! { get set }
    func showTransaction(_ transaction: TransferTransactionDetail)
    func showMessage(_ message: String)
    func showEncryptedButton()
    func showPublicKeyLoading()
    func hidePublicKeyLoading()
}

//sourcery: AutoMockable
protocol TransactionDetailPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: TransactionDetailView? { get set }
    var interactor: TransactionDetailUseCase! { get set }
    var router: TransactionDetailWireframe! { get set }

    func didClickEncrypted()
}

//sourcery: AutoMockable
protocol TransactionDetailUseCase: class {
    var output: TransactionDetailInteractorOutput! { get set }
    func fetchPublicKey(_ address: String)
}

//sourcery: AutoMockable
protocol TransactionDetailInteractorOutput: NemServicePublicKeyOutput {
}

//sourcery: AutoMockable
protocol TransactionDetailWireframe: class {
    var viewController: UIViewController? { get set }
    static func assembleModule(_ transaction: TransferTransactionDetail) -> UIViewController
}
