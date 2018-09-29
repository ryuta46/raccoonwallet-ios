//
// Created by Taizo Kusuda on 2018/09/09.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicatorView: UIView {
    private var indicator: UIActivityIndicatorView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        isHidden = true
    }
    
    func startLoading() {
        isHidden = false
        
        let indicator = UIActivityIndicatorView()
        indicator.sizeToFit()
        indicator.center = CGPoint(x: self.frame.width * 0.5, y: self.frame.height * 0.5)
        
        indicator.hidesWhenStopped = true
        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        addSubview(indicator)
        layoutIfNeeded()
        
        indicator.startAnimating()
        
        self.indicator = indicator
    }
    func stopLoading() {
        isHidden = true
        indicator?.stopAnimating()
        indicator?.removeFromSuperview()
        indicator = nil
    }
}
