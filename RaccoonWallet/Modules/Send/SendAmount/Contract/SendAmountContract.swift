//
//  SendAmountContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/03
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

struct SendMosaicDescription {
    let amount: String
    let localCurrency: String?
    let balance: String?
}

//sourcery: AutoMockable
protocol SendAmountView: BaseView {
    var presenter: SendAmountPresentation! { get set }

    func showAmount()
    func showMosaic()

    func showFirstAmountPage()
    func setSendMosaicDescriptions(_ mosaicDescriptions: [SendMosaicDescription])
    func setFormula(_ formula: String)

    func showLoading()
    func showMosaicWithXem()
    func hideMosaicWithXem(animated: Bool)
    func showMosaicOwned(_ mosaics: [MosaicDetail], selected: [MosaicDetail])
}

//sourcery: AutoMockable
protocol SendAmountPresentation: BasePresentation {
    var view: SendAmountView? { get set }
    var interactor: SendAmountUseCase! { get set }
    var router: SendAmountWireframe! { get set }

    func didClickMosaicTab()
    func didClickAmountTab()

    func didChangeAmountPage(_ pageIndex: Int)

    func didChangeFormula(_ formula: String)
    func didCalculateFormula(_ value: Decimal)
    func didConfirm()

    func didChangeMosaicWithXem(_ withXem: Bool)
    func didSelectMosaicOwned(_ mosaic: MosaicDetail)
    func didDeselectMosaicOwned(_ mosaic: MosaicDetail)
}

//sourcery: AutoMockable
protocol SendAmountUseCase: class {
    var output: SendAmountInteractorOutput! { get set }

    func fetchMosaicOwned(_ address: String)
    func fetchRate(_ currency: Currency)
}

//sourcery: AutoMockable
protocol SendAmountInteractorOutput: NemServiceMosaicOwnedOutput, RateServiceInteractorOutput {
}

//sourcery: AutoMockable
protocol SendAmountWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ sendTransaction: SendTransaction) -> UIViewController

    func presentSendMode(_ sendTransaction: SendTransaction)
}
