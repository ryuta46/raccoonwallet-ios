//
//  LessonIntroductionViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonIntroductionViewController : BaseViewController{
    var presenter: LessonIntroductionPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()

        title = R.string.localizable.common_security_lesson()
        hideBackTitle()

        message.text = R.string.localizable.lesson_introduction_message()

        navigationController?.removeHistoryUntil(WalletSelectViewController.self)
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension LessonIntroductionViewController: LessonIntroductionView {
}
