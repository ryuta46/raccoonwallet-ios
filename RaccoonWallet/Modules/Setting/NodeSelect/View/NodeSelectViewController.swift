//
//  NodeSelectViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class NodeSelectViewController: BaseViewController {
    var presenter: NodeSelectPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var nodeList: UITableView!
    @IBOutlet weak var nodeListHeight: NSLayoutConstraint!

    private var loadingView: FullScreenLoadingView!

    var nodes: [NemNode] = []
    var activeNodeUrl: String = ""
    override func setup() {
        super.setup()
        
        title = R.string.localizable.setting_node_select()

        loadingView = createFullScreenLoadingView()

        nodeList.delegate = self
        nodeList.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        if nodeList.contentSize.height > 0 {
            nodeListHeight.constant = nodeList.contentSize.height
        }

    }

}

extension NodeSelectViewController: NodeSelectView {
    func showLoading() {
        loadingView.startLoading()
    }

    func hideLoading() {
        loadingView.stopLoading()
    }

    func showActiveNode(_ activeNodeUrl: String) {
        self.activeNodeUrl = activeNodeUrl
        nodeList.reloadData()
    }

    func showNodes(_ nodes: [NemNode]) {
        self.nodes = nodes
        nodeList.reloadData()
    }
}

extension NodeSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectNode(nodes[indexPath.row])
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension NodeSelectViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodes.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nodeList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.nodeListCell, for: indexPath)! as NodeListCell
        let node = nodes[indexPath.row]
        cell.activeIndicator.isSelected = node.urlString == activeNodeUrl
        cell.nodeName.text = node.ip

        return cell
    }
}
