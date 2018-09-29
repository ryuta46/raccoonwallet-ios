//
//  DonationDetailContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/12
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol DonationDetailView: BaseView {
    var presenter: DonationDetailPresentation! { get set }

    func showDeveloper(_ developer: Developer)

    func showNotSetPinError()
    func showNotSelectWalletError()
}

//sourcery: AutoMockable
protocol DonationDetailPresentation: BasePresentation {
    var view: DonationDetailView? { get set }
    var interactor: DonationDetailUseCase! { get set }
    var router: DonationDetailWireframe! { get set }

    func didClickDonate()

    func didClickGoPinSetting()
    func didClickGoWalletSelect()
}

//sourcery: AutoMockable
protocol DonationDetailUseCase: class {
    var output: DonationDetailInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol DonationDetailInteractorOutput: class {
}

//sourcery: AutoMockable
protocol DonationDetailWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ developer: Developer) -> UIViewController

    func presentSendAmount(sendTransaction: SendTransaction)

    func presentSetting()
    func presentWalletSelect()
}
