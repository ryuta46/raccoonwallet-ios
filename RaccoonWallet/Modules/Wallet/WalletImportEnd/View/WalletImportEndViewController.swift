//
//  WalletImportEndViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/24.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletImportEndViewController: BaseViewController {
    var presenter: WalletImportEndPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var lesson: PrimaryButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = R.string.localizable.wallet_login_end_title()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.message.text = R.string.localizable.wallet_login_end_message()
        self.lesson.setTitle(R.string.localizable.common_security_lesson(), for: .normal)

        presenter.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTouchedLesson(_ sender: Any) {
        presenter.didClickLesson()
    }
    @IBAction func onTouchedHome(_ sender: Any) {
        presenter.didClickHome()
    }
}

extension WalletImportEndViewController : WalletImportEndView {
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
