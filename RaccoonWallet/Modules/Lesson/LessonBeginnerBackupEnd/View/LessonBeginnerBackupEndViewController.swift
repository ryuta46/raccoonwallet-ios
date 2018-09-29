//
//  LessonBeginnerBackupEndViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonBeginnerBackupEndViewController : BaseViewController{
    var presenter: LessonBeginnerBackupEndPresentation! { didSet { basePresenter = presenter} }

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var ok: PrimaryButton!
    
    override func setup() {
        super.setup()

        title = R.string.localizable.lesson_beginner_backup_end_title()
        hideBackTitle()

        message.text = R.string.localizable.lesson_beginner_backup_end_message()
        ok.setTitle(R.string.localizable.common_pin_settings(), for: .normal)
        navigationController?.removeHistoryUntil(WalletSelectViewController.self)
    }

    @IBAction func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension LessonBeginnerBackupEndViewController: PinDialogMixinViewController {
}

extension LessonBeginnerBackupEndViewController: LessonBeginnerBackupEndView {
    func showPinAlreadySetDialog() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.lesson_cancel_pin_title(),
                messages: [R.string.localizable.lesson_cancel_pin_message()]) { [weak self] _ in
            self?.presenter.didClickAlreadySetOk()
        }
        navigationController?.present(dialog, animated: true)
    }
}
