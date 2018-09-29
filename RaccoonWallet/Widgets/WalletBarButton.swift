//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class WalletBarButton: PrimaryCircleButton {
    private let insets = UIEdgeInsetsMake(
        Constant.walletBarButtonTapExpansion,
        Constant.walletBarButtonTapExpansion,
        Constant.walletBarButtonTapExpansion,
        Constant.walletBarButtonTapExpansion)

    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        var rect = bounds
        rect.origin.x -= insets.left
        rect.origin.y -= insets.top
        rect.size.width += insets.left + insets.right
        rect.size.height += insets.top + insets.bottom
        
        return rect.contains(point)
    }
}
