//
//  NavigationDrawerContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol NavigationDrawerView: BaseView {
    var presenter: NavigationDrawerPresentation! { get set }

    func showName(_ name: String)
    func showAddress(_ address: String)
}

//sourcery: AutoMockable
protocol NavigationDrawerPresentation: BasePresentation {
    var view: NavigationDrawerView? { get set }
    var interactor: NavigationDrawerUseCase! { get set }
    var router: NavigationDrawerWireframe! { get set }

    func didClickHome()
    func didClickAddressBook()
    func didClickGallery()
    func didClickDonation()
    func didClickAbout()
    func didClickHelp()
    func didClickSetting()
}

//sourcery: AutoMockable
protocol NavigationDrawerUseCase: class {
    var output: NavigationDrawerInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol NavigationDrawerInteractorOutput: class {
}

//sourcery: AutoMockable
protocol NavigationDrawerWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController

    func dismiss()
    func presentAddressBook()
    func presentGallery()
    func presentDonation()
    func presentAbout()
    func presentHelp()
    func presentSetting()
}
