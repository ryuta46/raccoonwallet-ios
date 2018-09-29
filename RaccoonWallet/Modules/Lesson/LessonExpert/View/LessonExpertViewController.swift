//
//  LessonExpertViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonExpertViewController: BaseViewController{
    var presenter: LessonExpertPresentation! { didSet { basePresenter = presenter} }

    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()

        title = R.string.localizable.lesson_expert_title()
        hideBackTitle()

        message.text = R.string.localizable.lesson_expert_message()
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension LessonExpertViewController: LessonExpertView {
}
