//
//  NodeSelectPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class NodeSelectPresenter: BasePresenter {
    weak var view: NodeSelectView?
    var interactor: NodeSelectUseCase!
    var router: NodeSelectWireframe!

    override func viewDidLoad() {
        super.viewDidLoad()

        view?.showActiveNode(ApplicationSetting.shared.nisUrl)
        view?.showLoading()
        interactor.fetchNodes()
    }
}

extension NodeSelectPresenter: NodeSelectPresentation {
    func didSelectNode(_ node: NemNode) {
        ApplicationSetting.shared.nisUrl = node.urlString
        view?.showActiveNode(node.urlString)
    }
}

extension NodeSelectPresenter: NodeSelectInteractorOutput {
    func nodesFetched(_ nodes: [NemNode]) {
        let filteredNodes: [NemNode]
        if nodes.count > Constant.maxNemNodes {
            filteredNodes = nodes[0..<Constant.maxNemNodes].map { $0 }
        } else {
            filteredNodes = nodes
        }
        view?.hideLoading()
        view?.showNodes(filteredNodes)
    }

    func nodesFetchFailed(_ error: Error) {
        Logger.shared.error(error.localizedDescription)
        view?.hideLoading()
        view?.showError(R.string.localizable.common_error_network())
    }
}
