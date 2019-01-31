//
//  SendConfirmationContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift

//sourcery: AutoMockable
protocol SendConfirmationView: BaseView, PinDialogMixinView {
    var presenter: SendConfirmationPresentation! { get set }

    func showCaution()

    func showAmounts(_ amounts: [String])
    func showFee(_ fee: String)
    func showDestination(_ destination: String, _ namespace: String)
    func showMessage(_ message: String)

    func showLoading()
    func hideLoading()
}

//sourcery: AutoMockable
protocol SendConfirmationPresentation: BasePresentation, PinDialogMixinPresentation {
    var view: SendConfirmationView? { get set }
    var interactor: SendConfirmationUseCase! { get set }
    var router: SendConfirmationWireframe! { get set }

    func didClickNeverRemind()
    func didClickBottomPanel()
}

//sourcery: AutoMockable
protocol SendConfirmationUseCase: class {
    var output: SendConfirmationInteractorOutput! { get set }

    func fetchMosaicSupply(_ mosaicIds: [MosaicId])
    func sendTransaction(_ request: [UInt8], _ keyPair: KeyPair)
}

//sourcery: AutoMockable
protocol SendConfirmationInteractorOutput: NemServiceMosaicSupplyListOutput, NemServiceSendTransactionOutput {
}

//sourcery: AutoMockable
protocol SendConfirmationWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController

    func presentSendEnd()
}
