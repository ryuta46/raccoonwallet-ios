//
// Created by Taizo Kusuda on 2018/09/08.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class FullScreenLoadingView: UIView {
    private var indicator: UIActivityIndicatorView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        backgroundColor = UIColor.black
        alpha = 0

        indicator = UIActivityIndicatorView()
        indicator.sizeToFit()
        indicator.center = self.center

        indicator.hidesWhenStopped = true
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge

        addSubview(indicator)

        isHidden = true
    }

    func startLoading() {
        isHidden = false
        indicator.startAnimating()
        alpha = 0

        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0.5
        }, completion: nil)

    }
    func stopLoading() {
        UIView.animate(withDuration: 0.1, animations: {
            self.alpha = 0
        }, completion:  { value in
            self.isHidden = true
            self.indicator.stopAnimating()
        })
    }
}
