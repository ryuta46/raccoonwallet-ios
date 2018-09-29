//
//  NodeSelectContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol NodeSelectView: BaseView {
    var presenter: NodeSelectPresentation! { get set }

    func showLoading()
    func hideLoading()
    func showActiveNode(_ activeNodeUrl: String)
    func showNodes(_ nodes: [NemNode])
}

//sourcery: AutoMockable
protocol NodeSelectPresentation: BasePresentation {
    var view: NodeSelectView? { get set }
    var interactor: NodeSelectUseCase! { get set }
    var router: NodeSelectWireframe! { get set }

    func didSelectNode(_ node: NemNode)

}

//sourcery: AutoMockable
protocol NodeSelectUseCase: class {
    var output: NodeSelectInteractorOutput! { get set }

    func fetchNodes()

}

//sourcery: AutoMockable
protocol NodeSelectInteractorOutput: class {
    func nodesFetched(_ nodes: [NemNode])
    func nodesFetchFailed(_ error: Error)
}

//sourcery: AutoMockable
protocol NodeSelectWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule() -> UIViewController
}
