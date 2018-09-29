//
//  NVActivityIndicatorViewExtension.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/16.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

extension NVActivityIndicatorView {
    func setup() {
        type = .ballSpinFadeLoader
        color = Theme.primary
    }

    func switchFrom(view: UIView) {
        view.isHidden = true
        startAnimating()
    }

    func switchTo(view: UIView) {
        view.isHidden = false
        view.alpha = 0
        self.alpha = 1

        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            view.alpha = 1.0
            self.alpha = 0
        }, completion: {(result) in
            if (result) {
                self.alpha = 1
                self.stopAnimating()
            }
        })
    }


}
