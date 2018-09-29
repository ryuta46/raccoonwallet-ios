//
//  WalletNewEndViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/22.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletNewEndViewController: BaseViewController {
    var presenter: WalletNewEndPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var lesson: PrimaryButton!
    @IBOutlet weak var home: SecondaryButton!

    override func setup() {
        super.setup()
        title = R.string.localizable.wallet_end_title()
        hideBackTitle()

        message.text = R.string.localizable.wallet_end_message()
        lesson.setTitle(R.string.localizable.common_security_lesson(), for: .normal)
    }

    @IBAction func onTouchedLesson(_ sender: Any) {
        presenter.didClickLesson()
    }
    
    @IBAction func onTouchedHome(_ sender: Any) {
        presenter.didClickHome()
    }
}

extension WalletNewEndViewController: WalletNewEndView {
    func showHomeCaution1() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.wallet_go_home_caution1_title(),
                messages: [R.string.localizable.wallet_go_home_caution1_message()],
                mode: .selectable,
                isCancelableOnTouchedOutside: true) { [weak self] result in
            if result == .ok {
                self?.presenter.didClickHomeCautionOk1()
            }
        }
        navigationController?.present(dialog, animated: true)
    }

    func showHomeCaution2() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.wallet_go_home_caution2_title(),
                messages: [R.string.localizable.wallet_go_home_caution2_message()],
                mode: .selectable,
                isCancelableOnTouchedOutside: true) { [weak self] result in
            if result == .ok {
                self?.presenter.didClickHomeCautionOk2()
            }
        }
        navigationController?.present(dialog, animated: true)
    }

}
