//
//  UIViewExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

enum ShadowVerticalLocation: String {
    case bottom
    case top
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UIViewController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }

    var navigationController: UINavigationController? {
        var parentResponder: UIResponder? = self
        while true {
            guard let nextResponder = parentResponder?.next else { return nil }
            if let viewController = nextResponder as? UINavigationController {
                return viewController
            }
            parentResponder = nextResponder
        }
    }

    func addShadow(location: ShadowVerticalLocation,
                   color: CGColor = Constant.shadowColor,
                   opacity: Float = Constant.shadowOpacity,
                   radius: CGFloat = Constant.shadowRadius) {
        switch location {
        case .bottom:
            addShadow(offset: Constant.shadowOffset, color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(
                    offset: CGSize(width: Constant.shadowOffset.width, height: -Constant.shadowOffset.height),
                    color: color, opacity: opacity, radius: radius)
        }
    }

    func addShadow(offset: CGSize,
                   color: CGColor = Constant.shadowColor,
                   opacity: Float = Constant.shadowOpacity,
                   radius: CGFloat = Constant.shadowRadius) {
        layer.masksToBounds = false
        layer.shadowColor = color
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
    }

    func addRectangleConstraints(_ target: UIView) {
        topAnchor.constraint(equalTo: target.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: target.bottomAnchor).isActive = true
        leadingAnchor.constraint(equalTo: target.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: target.trailingAnchor).isActive = true
    }

}
