//
//  WalletSelectPresenterTest.swift
//  RaccoonWalletTests
//
//  Created by Taizo Kusuda on 2018/08/19.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import SwiftyMocky

@testable import RaccoonWallet

class WalletSelectPresenterTest: XCTestCase {
    let interactor = WalletSelectUseCaseMock()
    let view = WalletSelectViewMock()
    let presenter = WalletSelectPresenter()

    override func setUp() {
        presenter.interactor = interactor
        presenter.view = view
    }

    func testViewDidLoad() {
        presenter.viewDidLoad()

        Verify(interactor, .fetchActiveId())
        Verify(interactor, .fetchWallets())
    }

    func testShowWallet() {
        let wallet = Wallet()
        presenter.walletsFetched([wallet])

        Verify(view, .showWallets(wallets: .value([wallet])))
    }

    func testShowWalletEmpty() {
        presenter.walletsFetched([])
        Verify(view, .showWalletEmpty())
    }

    func testShowActiveId() {
        let id = "testid"
        presenter.activeIdFetched(id)

        Verify(view, .showActiveId(activeId: .value(id)))
    }

}
