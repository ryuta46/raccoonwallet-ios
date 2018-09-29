//
//  UIColorExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }

    var lightened: UIColor {
        let components = cgColor.components!
        let red = components[0]
        let green = components[1]
        let blue = components[2]
        let alpha = components[3]

        return UIColor(
            red: (red + 1.0) * 0.5,
            green: (green + 1.0) * 0.5,
            blue: (blue + 1.0) * 0.5,
            alpha: alpha)
    }
}
