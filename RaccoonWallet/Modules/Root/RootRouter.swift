//
//  RootRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NemSwift
import REFrostedViewController

class RootRouter: RootWireframe {

    func presentScreen(in window: UIWindow) {
        NemSwiftConfiguration.logLevel = .none
        NemService.nis = URL(string: ApplicationSetting.shared.nisUrl) ?? URL(string: "http://176.9.68.110:7890")!
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10

        window.makeKeyAndVisible()

        // Clear key chain if first launch
        if ApplicationSetting.shared.isFirstLaunch {
            try? PinPreference.shared.clear()

            // first launch -> tutorial
            window.rootViewController = IntroductionConceptRouter.assembleModule()
        } else {
            // not first launch -> top
            window.rootViewController = RootRouter.assembleRootController()
        }

    }

    static func assembleRootController(withFront frontViewController: UIViewController? = nil) -> UIViewController {
        let topViewController = TopRouter.assembleModule()
        let navigationController = createNavigationController(with: topViewController)
        let menuViewController = NavigationDrawerRouter.assembleModule()
        let frostedViewController = REFrostedViewController(contentViewController: navigationController, menuViewController: menuViewController)!
        frostedViewController.panGestureEnabled = true
        if let frontViewController = frontViewController {
            navigationController.pushViewController(frontViewController, animated: false)
        }
        
        frostedViewController.modalPresentationStyle = .fullScreen

        return frostedViewController
    }

    private static func createNavigationController(with content: UIViewController ) -> UINavigationController {
        let navigation = RootNavigationController(rootViewController: content)
        navigation.navigationBar.tintColor = Theme.primary
        navigation.navigationBar.isTranslucent = false
        return navigation
    }
}


class RootNavigationController: UINavigationController {
    var locked: Bool = false
    var isFirstDisplay = true
    var reservedView: UIViewController? = nil

    var topMostViewController: UIViewController? {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController

        while topMostViewController?.presentedViewController != nil {
            topMostViewController = topMostViewController?.presentedViewController
        }
        return topMostViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarShadow()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstDisplay {
            showLockDialog()

            // To show pin code
            NotificationCenter.default.addObserver(
                    self,
                    selector: #selector(onWillEnterForeground(_:)),
                    name: NSNotification.Name.UIApplicationWillEnterForeground,
                    object: nil
            )

            isFirstDisplay = false
        }
    }

    @objc func onWillEnterForeground(_ notification: Notification?) {
        showLockDialog()
    }


    private func showLockDialog() {
        guard !locked else{
            return
        }

        guard PinPreference.shared.saved else {
            return
        }

        if ApplicationSetting.shared.isPinRequiredOnLaunch {

            let dialog = PinDialogRouter.assembleModule(forRegistration: false, cancelable: false) { pin in
                if pin != nil{
                    self.locked = false
                    // if navigation is reserved, push the page
                    if let reservedView = self.reservedView {
                        self.forceMove(to: reservedView)
                        self.reservedView = nil
                    }
                }
            }
            
            // Search presented ViewController
            if let topMostViewController = topMostViewController {
                topMostViewController.present(dialog, animated: true) {
                    self.locked = true
                }
            }
        }
    }
    
    private func setupNavigationBarShadow() {
        navigationBar.isTranslucent = false
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        
        navigationBar.layer.shadowColor = Constant.shadowColor
        navigationBar.layer.shadowOffset = Constant.shadowOffset
        navigationBar.layer.shadowRadius = Constant.shadowRadius
        navigationBar.layer.shadowOpacity = Constant.shadowOpacity
        navigationBar.layer.masksToBounds = false
    }
    
    func reserveNavigation(_ viewController: UIViewController) {
        if PinPreference.shared.saved && ApplicationSetting.shared.isPinRequiredOnLaunch {
            reservedView = viewController
        } else {
            forceMove(to: viewController)
        }
    }

    func forceMove(to viewController: UIViewController) {
        let presentView : () -> Void = {
            // go back to home
            self.popToRootViewController(animated: false)
            // then move to
            if viewController.modalPresentationStyle == .overCurrentContext {
                self.present(viewController, animated: false)
            } else {
                self.pushViewController(viewController, animated: false)
            }
        }

        if let presentedViewController = presentedViewController {// remove modal dialog
            presentedViewController.dismiss(animated: false) {
                presentView()
            }
        } else {
            presentView()
        }
    }
}
