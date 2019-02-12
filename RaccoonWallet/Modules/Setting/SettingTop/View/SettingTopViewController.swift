//
//  SettingTopViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class SettingTopViewController: BaseViewController {
    var presenter: SettingTopPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var menuListHeight: NSLayoutConstraint!
    @IBOutlet weak var menuList: UITableView!

    let menuHeaders = [
        R.string.localizable.common_general(),
        R.string.localizable.common_security()
    ]

    var biometricsType: BiometryType!

    var menus: [[String]] = []

    // items which have switch on right
    var switchMenus: [String] = []

    var isBiometricsRequired = false
    var isPinRequiredOnLaunch = false

    override func setup() {
        super.setup()

        title = R.string.localizable.common_settings()

        let biometricsType = LocalAuthenticationHelper.checkBiometrics()

        let requireBiometricsTitle: String
        if biometricsType == .none {
            // if no biometrics is available, display as touchId and disable the cell.
            requireBiometricsTitle = R.string.localizable.setting_require_biometrics(BiometryType.touchID.description)
        } else {
            requireBiometricsTitle = R.string.localizable.setting_require_biometrics(biometricsType.description)
        }

        self.biometricsType = biometricsType

        menus = [
            [
                R.string.localizable.setting_language_select(),
                R.string.localizable.setting_currency_select(),
                R.string.localizable.setting_notification_setting()
            ],
            [
                R.string.localizable.setting_change_password(),
                requireBiometricsTitle,
                R.string.localizable.setting_require_pin_on_launch(),
                R.string.localizable.setting_go_to_security_lesson()
            ]
        ]
        switchMenus = [
            requireBiometricsTitle,
            R.string.localizable.setting_require_pin_on_launch(),
        ]

        menuList.delegate = self
        menuList.dataSource = self
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        menuListHeight.constant = menuList.contentSize.height
    }

    @IBAction func onTouchedNode(_ sender: Any) {
        presenter.didClickNodeSelect()
    }

    @objc func onChangedRequireBiometrics(_ sender: UISwitch) {
        isBiometricsRequired = sender.isOn
        presenter.didChangeIsBiometricsRequired(sender.isOn)
    }

    @objc func onChangedRequirePinOnLaunch(_ sender: UISwitch) {
        isPinRequiredOnLaunch = sender.isOn
        presenter.didChangeIsPinRequiredOnLaunch(sender.isOn)
    }
}

extension SettingTopViewController: SettingTopView {
    func showIsBiometricsRequired(_ isBiometricsRequired: Bool) {
        self.isBiometricsRequired = isBiometricsRequired
        menuList.reloadData()
    }

    func showIsPinRequiredOnLaunch(_ isPinRequiredOnLaunch: Bool) {
        self.isPinRequiredOnLaunch = isPinRequiredOnLaunch
        menuList.reloadData()
    }

    func showPinDialogForRegistration() {
        let dialog = PinDialogRouter.assembleModule(forRegistration: true) { pin in
            if let pin = pin {
                self.presenter.didRegisterPin(pin)
            }
        }
        navigationController?.present(dialog, animated: true)
    }

    func showPinDialogForBiometrics() {
        let dialog = PinDialogRouter.assembleModule(forRegistration: false) { pin in
            if let pin = pin {
                self.presenter.didValidatePinForBiometrics(pin)
            }
        }
        navigationController?.present(dialog, animated: true)
    }


    func showBiometricsEnableDialog() {
        let biometrics = LocalAuthenticationHelper.checkBiometrics()
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.common_biometrics_enable_title(biometrics.description),
                messages: [R.string.localizable.common_biometrics_enable_message(biometrics.description)],
                mode: .selectable,
                style: .biometrics,
                isCancelableOnTouchedOutside: true) { [weak self] result in
            guard result == .ok else {
                self?.presenter.didClickCancelBiometrics()
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
                messages: [R.string.localizable.common_biometrics_enable_success_message(biometrics.description)],
                style: .success) { _ in
        }

        navigationController?.present(dialog, animated: true)
    }

    func showPinNotAvailableDialog() {
        let dialog = MessageDialogRouter.assembleModule(
                headline: R.string.localizable.setting_pin_not_available_title(),
                messages: [R.string.localizable.setting_pin_not_available_message()])
        navigationController?.present(dialog, animated: true)
    }
}

extension SettingTopViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.tableHeaderHeight
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = (menus[indexPath.section][indexPath.row])

        switch menu {
        case R.string.localizable.setting_language_select(): presenter.didClickLanguageSelect()
        case R.string.localizable.setting_currency_select(): presenter.didClickCurrencySelect()
        case R.string.localizable.setting_notification_setting(): presenter.didClickNotificationSetting()
        case R.string.localizable.setting_change_password(): presenter.didClickChangePassword()
        case R.string.localizable.setting_go_to_security_lesson(): presenter.didClickGoToSecurityLesson()
        default: break
        }
    }
}

extension SettingTopViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return menuHeaders.count
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuHeaders[section]
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus[safe: section]?.count ?? 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menu = (menus[indexPath.section][indexPath.row])

        if switchMenus.contains(menu) {
            let cell = menuList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.settingTopSwitchCell, for: indexPath)! as SettingTopSwitchCell
            // retrieve default settings
            cell.title.text = menu
            cell.title.textColor = UIColor.black
            cell.switchButton.removeTarget(nil, action: nil, for: .valueChanged)
            cell.switchButton.isUserInteractionEnabled = true

            if menu == R.string.localizable.setting_require_pin_on_launch() {
                cell.switchButton.setOn(isPinRequiredOnLaunch, animated: true)
                cell.switchButton.addTarget(self, action: #selector(onChangedRequirePinOnLaunch(_:)), for: .valueChanged)
            } else {
                if biometricsType! == .none {
                    cell.title.textColor = Theme.secondary
                    cell.switchButton.setOn(false, animated: true)
                    cell.switchButton.isUserInteractionEnabled = false
                } else {
                    cell.switchButton.setOn(isBiometricsRequired, animated: true)
                    cell.switchButton.addTarget(self, action: #selector(onChangedRequireBiometrics(_:)), for: .valueChanged)
                }
            }
            return cell
        } else {
            let cell = menuList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.settingTopDisclosureCell, for: indexPath)!
            cell.textLabel?.text = menu
            return cell
        }
    }
}
