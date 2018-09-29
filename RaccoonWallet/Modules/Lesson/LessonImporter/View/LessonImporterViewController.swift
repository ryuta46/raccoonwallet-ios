//
//  LessonImporterViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonImporterViewController: BaseViewController{
    var presenter: LessonImporterPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!

    override func setup() {
        super.setup()
        title = R.string.localizable.common_pin_settings()
        hideBackTitle()

        message.text = R.string.localizable.lesson_importer_message()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension LessonImporterViewController: PinDialogMixinViewController {
}

extension LessonImporterViewController: LessonImporterView {
    func showPinAlreadySetDialog() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.lesson_cancel_pin_title(),
                messages: [R.string.localizable.lesson_cancel_pin_message()]) { [weak self] _ in
            self?.presenter.didClickAlreadySetOk()
        }
        navigationController?.present(dialog, animated: true)
    }
}
