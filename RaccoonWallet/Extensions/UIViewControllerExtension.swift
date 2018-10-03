//
//  UIViewControllerExtension.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/25.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialSnackbar
import NVActivityIndicatorView

extension UIViewController {

    func resetRootViewController() {
        if let _ = navigationController?.viewControllers[safe: 0] as? TopViewController {
            let topView = TopRouter.assembleModule()
            topView.loadViewIfNeeded()
            navigationController?.viewControllers[0] = topView
        }
    }

    func hideBackTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }

    func pushWithNavigation(_ viewController: UIViewController) {
        navigationController?.pushViewController(viewController, animated: true)
    }

    func showInfoPopup(_ message: String) {
        let snackbarMessage = MDCSnackbarMessage()
        snackbarMessage.text = message
        
        let manager = MDCSnackbarManager()
        manager.setBottomOffset(tabBarController?.tabBar.frame.height ?? 0)

        manager.show(snackbarMessage)
    }

    func showErrorPopup(_ message: String) {
        let snackbarMessage = MDCSnackbarMessage()
        snackbarMessage.text = message

        let manager = MDCSnackbarManager()
        manager.snackbarMessageViewBackgroundColor = Theme.error
        manager.setBottomOffset(tabBarController?.tabBar.frame.height ?? 0)

        manager.show(snackbarMessage)
    }

    func createFullScreenLoadingView() -> FullScreenLoadingView {
        if let navigationController = navigationController {
            let loadingView = FullScreenLoadingView(frame: navigationController.view.bounds)
            navigationController.view.addSubview(loadingView)
            return loadingView
        } else {
            let loadingView = FullScreenLoadingView(frame: view.bounds)
            view.addSubview(loadingView)
            return loadingView
        }
    }

    func createBarButton(image: UIImage, size: Int, action: Selector) -> UIButton {
        let button = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: Double(size), height: Double(size)))
        button.setImage(image, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
        button.heightAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true

        return button
    }

    func addTouchEvent(view: UIView, selector: Selector) {
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))
    }
}
