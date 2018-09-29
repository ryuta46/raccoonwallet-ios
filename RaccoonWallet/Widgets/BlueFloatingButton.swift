//
// BlueFloatingButton.swift
//
// Created by Taizo Kusuda on 2018/08/30.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import MaterialComponents

class BlueFloatingButton: MDCFloatingButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        backgroundColor = Theme.nemBlue
    }
}
