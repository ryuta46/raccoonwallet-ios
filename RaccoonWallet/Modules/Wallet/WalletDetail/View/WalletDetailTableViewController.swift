//
//  WalletDetailTableViewController.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/28.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class WalletDetailTableViewController: UITableViewController {
    var walletStructure = "-"
    var importance = "-"
    var publicKey = "-"

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)

        let title: String
        let detailText: String
        switch indexPath.row {
        case 0:
            title = R.string.localizable.wallet_detail_structure()
            detailText = walletStructure
        case 1:
            title = R.string.localizable.wallet_detail_importance()
            detailText = importance
        case 2:
            title = R.string.localizable.common_public_key()
            detailText = publicKey
        default:
            title = ""
            detailText = ""
        }
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = detailText

        return cell
    }
}