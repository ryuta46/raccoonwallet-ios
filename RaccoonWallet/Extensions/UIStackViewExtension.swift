//
// Created by Taizo Kusuda on 2018/09/06.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

extension UIStackView {
    func showSubview(_ subview: UIView, visible: Bool, animated: Bool, completion: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: 0.5,
                    delay: 0.0,
                    usingSpringWithDamping: 0.9,
                    initialSpringVelocity: 1,
                    options: [],
                    animations: {
                        subview.isHidden = !visible
                        self.layoutIfNeeded()
                    },
                    completion: { _ in
                        completion?()
                    } )
        } else {
            subview.isHidden = !visible
        }
    }
}