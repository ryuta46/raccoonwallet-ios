//
//  TopViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import REFrostedViewController

class TopViewController: UITabBarController {
    var presenter: TopPresentation!
    var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = Theme.primary
        setupTabs()
        setupMenuButton()

        //title = "HELLO NEMber"
        hideBackTitle()

        presenter.viewDidLoad()
        
        let edgeGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(onPannedLeft(_:)))
        edgeGesture.edges = .left

        view.addGestureRecognizer(edgeGesture)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupTabs() {
        self.viewControllers = [
            QrLabTabRouter.assembleModule(),
            ReceiveTabRouter.assembleModule(),
            HomeTabRouter.assembleModule(),
            SendTabRouter.assembleModule(),
            ScanTabRouter.assembleModule()
        ]

    }

    private func setupMenuButton() {
        menuButton = UIBarButtonItem()
        menuButton.customView = createBarButton(image: R.image.icon_menu()!, size: Constant.menuIconSize, action: #selector(onTouchedMenu(_:)))

        navigationItem.leftBarButtonItem = menuButton
    }

    @objc func onTouchedMenu(_ sender: Any) {
        presenter.didClickMenu()
    }

    @objc func onPannedLeft(_ sender: UIScreenEdgePanGestureRecognizer) {
        frostedViewController.panGestureRecognized(sender)
    }

}

extension TopViewController: TopView{
    func showDrawer() {
        frostedViewController.presentMenuViewController()
    }
    func showHome() {
        selectedIndex = 2
    }
}
