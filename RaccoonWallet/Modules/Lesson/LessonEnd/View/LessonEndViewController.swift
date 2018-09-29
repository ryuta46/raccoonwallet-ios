//
//  LessonEndViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonEndViewController: BaseViewController {
    var presenter: LessonEndPresentation! { didSet { basePresenter = presenter} }
    
    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()
        title = R.string.localizable.lesson_end_title()
        navigationItem.hidesBackButton = true
        hideBackTitle()
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension LessonEndViewController: LessonEndView {
    func showText(_ level: LessonLevel) {
        switch level{
        case .beginner:
            self.message.text = R.string.localizable.lesson_beginner_end_message()
        case .importer:
            self.message.text = R.string.localizable.lesson_importer_end_message()
        case .expert:
            self.message.text = R.string.localizable.lesson_expert_end_message()
        }
    }
}
