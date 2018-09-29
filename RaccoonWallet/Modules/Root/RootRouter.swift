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
        NemService.nis = URL(string: ApplicationSetting.shared.nisUrl) ?? URL(string: "https://nismain.ttechdev.com:7891")!

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
    
    var topMostViewController: UIViewController? {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
        
        while topMostViewController?.presentedViewController != nil {
            topMostViewController = topMostViewController?.presentedViewController
        }
        return topMostViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStatusBarColor()

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
}
