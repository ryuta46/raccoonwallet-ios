//
//  BaseViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseView {
    var basePresenter: BasePresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideBackTitle()
        setup()
        basePresenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self,
                selector: #selector(keyboardWillShow(notification:)),
                name: NSNotification.Name.UIKeyboardWillShow,
                object: nil)
        NotificationCenter.default.addObserver(self,
                selector: #selector(keyboardWillHide(notification:)) ,
                name: NSNotification.Name.UIKeyboardWillHide,
                object: nil)

        basePresenter.viewWillAppear()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        basePresenter.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self,
                name: NSNotification.Name.UIKeyboardWillShow,
                object: nil)
        NotificationCenter.default.removeObserver(self,
                name: NSNotification.Name.UIKeyboardWillHide,
                object: nil)

        basePresenter.viewWillDisappear()


    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        basePresenter.viewDidDisappear()
    }

    func setup() {

    }

    func showInfo(_ message: String) {
        showInfoPopup(message)
    }
    func showError(_ message: String) {
        showErrorPopup(message)
    }

    @objc private func keyboardWillShow(notification: Notification) {
        let info = notification.userInfo!
        let keyboardFrame = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let animationDuration = (info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        keyboardWillShow(keyboardFrame: keyboardFrame, duration: animationDuration)
    }

    func keyboardWillShow(keyboardFrame: CGRect, duration: TimeInterval) {

    }

    @objc private func keyboardWillHide(notification: Notification) {
        keyboardWillHide()
    }

    func keyboardWillHide() {

    }

}
