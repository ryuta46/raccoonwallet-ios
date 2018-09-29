//
//  LessonPinEndViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class LessonPinEndViewController : BaseViewController, PinDialogMixinViewController{
    var presenter: LessonPinEndPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var setting: PrimaryButton!
    @IBOutlet weak var lessonEnd: PrimaryButton!

    override func setup() {
        super.setup()

        let biometrics = LocalAuthenticationHelper.checkBiometrics()
        title = R.string.localizable.lesson_pin_end_title(biometrics.description)
        navigationItem.hidesBackButton = true

        hideBackTitle()

        message.text = R.string.localizable.lesson_pin_end_message(biometrics.description)

        setting.setTitle(R.string.localizable.lesson_pin_end_set_ok(biometrics.description), for: .normal)
        lessonEnd.setTitle(R.string.localizable.lesson_pin_end_home(), for: .normal)
    }

    @IBAction func onTouchedSet(_ sender: Any) {
        presenter.didClickSet()
    }
    @IBAction func onTouchedLessonEnd(_ sender: Any) {
        presenter.didClickLessonEnd()
    }
}

extension LessonPinEndViewController: LessonPinEndView {
    func showBiometricsEnableDialog() {
        let biometrics = LocalAuthenticationHelper.checkBiometrics()
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.common_biometrics_enable_title(biometrics.description),
                messages: [R.string.localizable.common_biometrics_enable_message(biometrics.description)],
                mode: .selectable,
                isCancelableOnTouchedOutside: true) { [weak self] result in
            guard result == .ok else {
                return
            }
            self?.presenter.didClickEnableBiometrics()
        }

        navigationController?.present(dialog, animated: true)

    }
    func showBiometricsSuccessDialog() {
        let biometrics = LocalAuthenticationHelper.checkBiometrics()
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.common_biometrics_enable_success_title(),
                messages: [R.string.localizable.common_biometrics_enable_success_message(biometrics.description)]) { _ in
            self.presenter.didClickSuccessOk()
        }

        navigationController?.present(dialog, animated: true)
    }
}
