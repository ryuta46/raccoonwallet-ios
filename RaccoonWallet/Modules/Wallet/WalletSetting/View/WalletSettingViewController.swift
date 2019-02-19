//
//  WalletSettingViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/28.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class WalletSettingViewController: BaseViewController {
    var presenter: WalletSettingPresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var walletBar: WalletBar!
    @IBOutlet weak var walletType: UILabel!
    @IBOutlet weak var walletTypeContent: UIStackView!
    @IBOutlet weak var loading: NVActivityIndicatorView!


    @IBOutlet weak var general: UILabel!

    @IBOutlet weak var menuList: UITableView!
    @IBOutlet weak var menuListHeight: NSLayoutConstraint!

    private var fullScreenLoading: FullScreenLoadingView!

    let menus = [
        R.string.localizable.wallet_settings_detail(),
        R.string.localizable.wallet_settings_address(),
        R.string.localizable.wallet_settings_backup(),
        R.string.localizable.wallet_settings_rename(),
        R.string.localizable.wallet_settings_delete()
    ]
    override func setup() {
        super.setup()

        title = R.string.localizable.wallet_settings_title()
        view.backgroundColor = Theme.baseBackground

        general.text = R.string.localizable.wallet_settings_general()

        menuList.delegate = self
        menuList.dataSource = self
        menuList.reloadData()

        loading.setup()
        fullScreenLoading = createFullScreenLoadingView()
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        menuListHeight.constant = menuList.contentSize.height
    }
}

extension WalletSettingViewController: PinDialogMixinViewController {
}

extension WalletSettingViewController : WalletSettingView {
    func showWalletName(_ wallet: Wallet) {
        walletBar.wallet = wallet
        walletBar.hasIcon = false
        walletBar.reloadWallet()
    }

    func showLoading() {
        //loading.startAnimating()
        //walletTypeContent.isHidden = true
        walletType.text = "-"

        fullScreenLoading.startLoading()
    }

    func showWalletType(_ walletType: String) {
        self.walletType.text = walletType
        //loading.switchTo(view: walletTypeContent)

        fullScreenLoading.stopLoading()
    }

    func showRenameDialog() {
        let dialog = WalletRenameRouter.assembleModule { [weak self] newName in
            if let newName = newName {
                self?.presenter.didChangeName(newName)
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}

extension WalletSettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = menus[indexPath.row]
        switch menu {
        case R.string.localizable.wallet_settings_detail(): presenter.didClickDetail()
        case R.string.localizable.wallet_settings_address(): presenter.didClickAddress()
        case R.string.localizable.wallet_settings_backup(): presenter.didClickBackup()
        case R.string.localizable.wallet_settings_rename(): presenter.didClickRename()
        case R.string.localizable.wallet_settings_delete():presenter.didClickDelete()
        default: break
        }
    }
}

extension WalletSettingViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  menuList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.walletSettingCell, for: indexPath)!
        cell.textLabel?.text = menus[indexPath.row]

        return cell
    }
}
