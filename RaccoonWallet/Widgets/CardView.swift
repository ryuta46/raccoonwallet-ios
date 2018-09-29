//
//  CardView.swift
//  NemPaymentApp
//
//  Created by Taizo Kusuda on 2018/02/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialCards

class CardView: MDCCard {
    private var handler: (() -> Void)?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedCard(_:))))
    }

    func setOnTouchedHandler(handler: @escaping () -> Void) {
        self.handler = handler
    }

    @objc func onTouchedCard(_ sender: Any) {
        handler?()
    }
}
