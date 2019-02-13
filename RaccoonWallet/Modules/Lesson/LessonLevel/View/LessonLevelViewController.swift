//
//  LessonLevelViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonLevelViewController : BaseViewController{
    var presenter: LessonLevelPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var beginnerCard: CardView!
    @IBOutlet weak var beginnerTitle: UILabel!
    @IBOutlet weak var beginnerContents: UILabel!
    @IBOutlet weak var beginnerMessage: UILabel!
    
    @IBOutlet weak var importCard: CardView!
    @IBOutlet weak var importTitle: UILabel!
    @IBOutlet weak var importContents: UILabel!
    @IBOutlet weak var importMessage: UILabel!

    @IBOutlet weak var expertCard: CardView!
    @IBOutlet weak var expertTitle: UILabel!
    @IBOutlet weak var expertContents: UILabel!
    @IBOutlet weak var expertMessage: UILabel!
    
    override func setup() {
        title = R.string.localizable.lesson_level_title()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.backgroundColor = Theme.baseBackground

        beginnerCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedBeginnerCard(_:))))
        importCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedImportCard(_:))))
        expertCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTouchedExpertCard(_:))))

        beginnerTitle.text = R.string.localizable.lesson_level_beginner_title()
        beginnerContents.text = R.string.localizable.lesson_level_beginner_setup()
        beginnerMessage.text = R.string.localizable.lesson_level_beginner_message()

        importTitle.text = R.string.localizable.lesson_level_importer_title()
        importContents.text = R.string.localizable.lesson_level_importer_setup()
        importMessage.text = R.string.localizable.lesson_level_importer_message()

        expertTitle.text = R.string.localizable.lesson_level_expert_title()
        expertContents.text = R.string.localizable.lesson_level_expert_setup()
        expertMessage.text = R.string.localizable.lesson_level_expert_message()
    }

    @objc func onTouchedBeginnerCard(_ sender: Any) {
        presenter.didClickBeginner()
    }
    @objc func onTouchedImportCard(_ sender: Any) {
        presenter.didClickImport()
    }
    @objc func onTouchedExpertCard(_ sender: Any) {
        presenter.didClickExpert()
    }
}

extension LessonLevelViewController : LessonLevelView {
}
