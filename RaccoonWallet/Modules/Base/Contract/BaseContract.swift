//
//  BaseContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol BaseView: class {
    func showInfo(_ message: String)
    func showError(_ message: String)
}

//sourcery: AutoMockable
protocol BasePresentation: class {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

//sourcery: AutoMockable
protocol BaseUseCase: class {
}

//sourcery: AutoMockable
protocol BaseInteractorOutput: class {
}

//sourcery: AutoMockable
protocol BaseWireframe: class {
}
