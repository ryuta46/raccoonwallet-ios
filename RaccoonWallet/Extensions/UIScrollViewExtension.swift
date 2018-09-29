//
// Created by Taizo Kusuda on 2018/09/15.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
extension UIScrollView {
    func setOffsetY(_ offset: CGFloat, duration: TimeInterval) {
        let absoluteOffset = contentInset.bottom + offset

        UIView.animate(
                withDuration: duration,
                animations: {
                    let contentInsets = UIEdgeInsetsMake(0, 0, absoluteOffset, 0)
                    self.contentInset = contentInsets
                    self.scrollIndicatorInsets = contentInsets
                    self.contentOffset = CGPoint(x: 0, y: absoluteOffset)
                }
        )
    }

    func clearOffset() {
        contentInset = UIEdgeInsets.zero
        scrollIndicatorInsets = UIEdgeInsets.zero
        contentOffset = CGPoint.zero
    }

}