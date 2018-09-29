//
//  DonationTopContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol DonationTopView: BaseView {
    var presenter: DonationTopPresentation! { get set }
}

//sourcery: AutoMockable
protocol DonationTopPresentation: BasePresentation {
    var view: DonationTopView? { get set }
    var interactor: DonationTopUseCase! { get set }
    var router: DonationTopWireframe! { get set }

    func didClickDeveloper(_ developer: Developer)
}

//sourcery: AutoMockable
protocol DonationTopUseCase: class {
    var output: DonationTopInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol DonationTopInteractorOutput: class {
}

//sourcery: AutoMockable
protocol DonationTopWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func presentDonationDetail(_ developer: Developer)
}
