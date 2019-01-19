//
//  AboutViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import StoreKit

class AboutViewController: BaseViewController {
    var presenter: AboutPresentation! { didSet {basePresenter = presenter} }
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var privacyButton: UIButton!
    
    @IBOutlet weak var menuList: UITableView!
    @IBOutlet weak var menuListHeight: NSLayoutConstraint!
    let menus = [
        R.string.localizable.about_official_site(),
        R.string.localizable.about_discord(),
        R.string.localizable.about_open_source(),
        //R.string.localizable.about_review()
    ]

    override func setup() {
        super.setup()
        
        title = R.string.localizable.about_title()
        
        message.text = R.string.localizable.about_app_concept()

        privacyButton.setTitle(R.string.localizable.common_privacy_policy(), for: .normal)

        menuList.delegate = self
        menuList.dataSource = self
        menuList.reloadData()
    }
    @IBAction func onTouchedPrivacyButton(_ sender: Any) {
        presenter.didClickPrivacyPolicy()
    }

    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        menuListHeight.constant = menuList.contentSize.height
    }
}

extension AboutViewController: AboutView {
    func showReviewInApp() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
}

extension AboutViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch menus[indexPath.row] {
        case R.string.localizable.about_official_site(): presenter.didClickOfficialSite()
        case R.string.localizable.about_discord(): presenter.didClickDiscord()
        case R.string.localizable.about_open_source(): presenter.didClickOpenSource()
        case R.string.localizable.about_review(): presenter.didClickReview()
        default: break
        }
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.tableHeaderHeight
    }

    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = Theme.slightAccentBackground
    }
}

extension AboutViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return R.string.localizable.common_app_title()
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuList.dequeueReusableCell(withIdentifier: R.reuseIdentifier.aboutCell, for: indexPath)! as AboutCell
        cell.title.text = menus[indexPath.row]
        return cell
    }
}
