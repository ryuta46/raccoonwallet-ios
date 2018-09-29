//
//  LessonBeginnerViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonBeginnerViewController : BaseViewController{
    var presenter: LessonBeginnerPresentation! { didSet { basePresenter = presenter} }

    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()
        title = R.string.localizable.lesson_beginner_title()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        message.text = R.string.localizable.lesson_beginner_message()
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension LessonBeginnerViewController: LessonBeginnerView {
}
