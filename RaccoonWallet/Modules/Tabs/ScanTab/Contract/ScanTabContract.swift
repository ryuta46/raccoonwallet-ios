//
//  ScanTabContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol ScanTabView: BaseView {
    var presenter: ScanTabPresentation! { get set }

    func startScan()
    func stopScan()

    func showLoading()
    func hideLoading()
    func pause(_ isPaused: Bool)

    func showNotSetPinError()
    func showNotSelectWalletError()
}

//sourcery: AutoMockable
protocol ScanTabPresentation: BasePresentation {
    var view: ScanTabView? { get set }
    var interactor: ScanTabUseCase! { get set }
    var router: ScanTabWireframe! { get set }

    func didScanAddress(_ address: String)
    func didScanInvoice(_ invoice: InvoiceQr)
    func didCatchError(_ message: String)

    func didClickGoPinSetting()
    func didClickGoWalletSelect()
}

//sourcery: AutoMockable
protocol ScanTabUseCase: class {
    var output: ScanTabInteractorOutput! { get set }

    func fetchPublicKey(_ address: String)
}

//sourcery: AutoMockable
protocol ScanTabInteractorOutput: NemServicePublicKeyOutput {
}

//sourcery: AutoMockable
protocol ScanTabWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentSendAmount(_ sendTransaction: SendTransaction)
    func presentSendMode(_ sendTransaction: SendTransaction)
    func presentSendConfirmation(_ sendTransaction: SendTransaction)

    func presentSetting()
    func presentWalletSelect()
}
