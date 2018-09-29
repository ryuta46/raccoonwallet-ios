//
//  UITableViewControllerExtension.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/28.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

extension UITableViewController {
    var sumRowHeight: CGFloat {
        var sum: CGFloat = 0

        if let tableView = tableView {
            for section in 0..<tableView.numberOfSections {
                for row in  0..<tableView.numberOfRows(inSection: 0) {
                    sum += self.tableView(tableView, heightForRowAt: IndexPath(row: row, section: section))
                }
            }
        }
        return sum
    }
}