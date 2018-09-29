//
//  UINavigationControllerExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

extension UINavigationController {
    func pushViewControllerFromTop(_ view: UIViewController) {
        self.view.layer.removeAllAnimations()
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)

        self.view.layer.add(transition, forKey: kCATransition)

        pushViewController(view, animated: false)
    }

    func popViewControllerFromBottom() {
        popViewController(animated: false)
        
        self.view.layer.removeAllAnimations()
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        self.view.layer.add(transition, forKey: kCATransition)
    }
    func popToRootViewControllerFromBottom() {
        popToRootViewController(animated: false)
        
        self.view.layer.removeAllAnimations()
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        
        self.view.layer.add(transition, forKey: kCATransition)
    }

    func popToViewController<T>(_ targetType: T.Type) where T: UIViewController {
        if let targetIndex = viewControllers.index( where: { type(of: $0) == targetType }) {
            popToViewController(viewControllers[targetIndex], animated: true)
        }
    }


    func removeHistoryUntil<T>(_ targetType: T.Type) where T: UIViewController {
        if let targetIndex = viewControllers.index( where: { type(of: $0) == targetType }) {
            let newStack = viewControllers.enumerated().filter {
                $0.offset <= targetIndex || $0.offset == viewControllers.count - 1 }.map { $0.element }
            viewControllers = newStack
        }
    }
}
