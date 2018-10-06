//
//  AppDelegate.swift
//  RaccoonWallet
//
//  Created by 楠田泰三 on 2018/08/14.
//  Copyright © 2018年 com.ttechsoft. All rights reserved.
//

import UIKit
import REFrostedViewController
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // setup logger
        Logger.setup()
        // setup firebase
        FirebaseApp.configure()

        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRouter().presentScreen(in: window!)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            if let url = userActivity.webpageURL {
                if let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
                    let host = components.host, let queries = components.queryItems {
                    
                    let queryDictionary = Dictionary(uniqueKeysWithValues: queries.compactMap{ $0.value == nil ? nil : ( $0.name, $0.value!) })
                    
                    guard host == "ryuta46.com" else {
                        return false
                    }

                    guard let address = queryDictionary["addr"],
                        let amountString = queryDictionary["amount"],
                        let amount = UInt64(amountString) else {
                            return false
                    }
                    let msg = queryDictionary["msg"]

                    var sendTransaction = SendTransaction(address: address, publicKey: nil)
                    sendTransaction.mosaics = [MosaicDetail.xem(amount)]
                    sendTransaction.message = msg
                    sendTransaction.messageType = .plain

                    DeepLinNavigation().presentSendConfirmation(sendTransaction)
                }
            }
        }
        return true
    }


    class DeepLinNavigation {
        var navigationController: UINavigationController? = nil

        func presentSendConfirmation(_ sendTransaction: SendTransaction) {
            let frontViewController: UIViewController?
            let errorDialog: UIViewController?

            if !PinPreference.shared.saved {
                frontViewController = nil
                errorDialog = MessageDialogPreset.createErrorNotSetPin { result in
                    if result == .ok {
                        self.navigationController?.pushViewController(SettingTopRouter.assembleModule(), animated: true)
                    }
                }
            } else if WalletHelper.activeWallet == nil {
                frontViewController = nil
                errorDialog = MessageDialogPreset.createErrorNotSelectWallet { result in
                    if result == .ok {
                        self.navigationController?.pushViewControllerFromTop(WalletSelectRouter.assembleModule())
                    }
                }
            } else {
                frontViewController = SendConfirmationRouter.assembleModule(sendTransaction)
                errorDialog = nil
            }

            if let root = RootRouter.assembleRootController(withFront: frontViewController) as? REFrostedViewController,
               let navigationController = root.contentViewController as? UINavigationController,
               let rootViewController = UIApplication.shared.keyWindow?.rootViewController {

                rootViewController.dismiss(animated: false) {
                    self.navigationController = navigationController
                    rootViewController.present(root, animated: false) {
                        if let errorDialog = errorDialog {
                            navigationController.present(errorDialog, animated: true)
                        }
                    }
                }
            }
        }
    }

}
