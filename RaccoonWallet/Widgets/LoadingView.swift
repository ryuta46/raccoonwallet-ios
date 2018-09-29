//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class LoadingView {
    private weak var target: UIView?
    let indicator: NVActivityIndicatorView

    init(target: UIView, frame: CGRect? = nil) {
        self.target = target

        if let frame = frame {
            indicator = NVActivityIndicatorView(frame: frame)
        } else {
            indicator = NVActivityIndicatorView(frame: target.frame)
        }


        target.superview?.addSubview(indicator)

        indicator.type = .ballSpinFadeLoader
        indicator.color = Theme.primary
        indicator.sizeToFit()
    }

    func dispose() {
        indicator.removeFromSuperview()
    }


    func startLoading() {
        //target?.isHidden = true
        target?.alpha = 0
        indicator.startAnimating()
    }


    func stopLoading() {
        target?.isHidden = false
        target?.alpha = 0
        indicator.alpha = 1

        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            self.target?.alpha = 1.0
            self.indicator.alpha = 0
        }, completion: {(result) in
            if (result) {
                self.indicator.alpha = 1
                self.indicator.stopAnimating()
            }
        })
    }

}