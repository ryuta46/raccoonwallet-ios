//
//  SendAmountPresenterTest.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import XCTest
@testable import RaccoonWallet
import SwiftyMocky
import NemSwift

class SendAmountPresenterTest: XCTestCase {
    var presenter: SendAmountPresenter!
    var view: SendAmountViewMock!
    var interactor: SendAmountUseCaseMock!
    var router: SendAmountWireframeMock!

    override func setUp() {
        TestSettings.setUp()
        presenter = SendAmountPresenter()
        view = SendAmountViewMock()
        interactor = SendAmountUseCaseMock()
        router = SendAmountWireframeMock()

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    }

    func testViewDidLoad() {
        presenter.viewDidLoad()
        Verify(interactor, .fetchMosaicOwned(address:.any(String.self)))
    }

    func testDidClickAmountTab() {
        presenter.didClickAmountTab()
        Verify(view, .showAmount())

    }
    func testDidClickMosaicTab() {
        presenter.didClickMosaicTab()
        Verify(view, .showMosaic())
    }

    func testDidChangeAmountPage() {
        let page = 5
        presenter.didChangeAmountPage(page)

        XCTAssertEqual(page, presenter.activePageIndex)
    }

    func testDidChangeFormula() {
        Perform(view, .setAmounts(amounts: .any([String].self), perform: { (amounts) in print(amounts)}))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, supply: 100, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // pages are [xem , mosaic].
        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        presenter.didChangeMosaicWithXem(true) // and with xem

        // set page index 1
        presenter.didChangeAmountPage(1)

        // set formula
        let formula = "5 + 4"
        presenter.didChangeFormula(formula)

        let expected = [
            "0 XEM",
            "5 + 4 ttech:ryuta"
        ]

        Verify(view, .setAmounts(amounts: .value(expected)))
    }

    func testDidCalculateFormula() {
        Perform(view, .setAmounts(amounts: .any([String].self), perform: { (amounts) in print(amounts)}))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, supply: 100, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // pages are [xem , mosaic].


        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setAmounts(amounts: .value(["0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(true) // and with xem

        // set page index 1
        presenter.didChangeAmountPage(1)

        // set formula
        let expected = [
            "0 XEM",
            "90 ttech:ryuta"
        ]

        presenter.didChangeFormula("90")
        Verify(view, .setAmounts(amounts: .value(expected)))

        // Formula is used
        presenter.didCalculateFormula(100)
        Verify(view, .setAmounts(amounts: .value(expected)))

    }


    func testDidConfirm() {
        var transaction = SendTransaction(address: "test", publicKey: nil)
        presenter.sendTransaction = transaction

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, supply: 100, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // pages are [xem , mosaic].
        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        presenter.didChangeMosaicWithXem(true) // and with xem

        // set page index 1
        presenter.didChangeAmountPage(1)

        // set value
        let expected = [
            "0 XEM",
            "100 ttech:ryuta"
        ]
        presenter.didChangeFormula("100")
        Verify(view, .setAmounts(amounts: .value(expected)))

        presenter.didCalculateFormula(100)
        Verify(view, .setAmounts(amounts: .value(expected)))

        presenter.didConfirm()

        transaction.mosaics = [
            MosaicDetail.xem(0),
            mosaics[0].replaced(quantity: 100)
        ]

        Verify(router, .presentSendMode(sendTransaction: .value(transaction)))
    }

    func testDidChangeMosaicWithXem() {
        Perform(view, .setAmounts(amounts: .any([String].self), perform: { (amounts) in print(amounts)}))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, supply: 100, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // default is not with xem
        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setAmounts(amounts: .value(["0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(true) // with xem
        Verify(view, .setAmounts(amounts: .value(["0 XEM", "0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(false) // not with xem
        Verify(view, .setAmounts(amounts: .value(["0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(true) // with xem
        Verify(view, .setAmounts(amounts: .value(["0 XEM", "0 ttech:ryuta"])))

        presenter.didChangeAmountPage(0)

        presenter.didChangeFormula("10")
        presenter.didCalculateFormula(10)

        Verify(view, .setAmounts(amounts: .value(["10 XEM", "0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(false)
        Verify(view, .setAmounts(amounts: .value(["0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(true) // xem amount is clear
        Verify(view, .setAmounts(amounts: .value(["0 XEM", "0 ttech:ryuta"])))
    }

    func testDidClickMosaicOwned() {
        Perform(view, .setAmounts(amounts: .any([String].self), perform: { (amounts) in print(amounts)}))

        // default is only xem
        presenter.viewDidLoad()
        Verify(view, .setAmounts(amounts: .value(["0 XEM"])))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, supply: 100, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setAmounts(amounts: .value(["0 ttech:ryuta"])))

        presenter.didChangeMosaicWithXem(true) // with xem
        Verify(view, .setAmounts(amounts: .value(["0 XEM", "0 ttech:ryuta"])))

        presenter.didDeselectMosaicOwned(mosaics[0]) // deselect mosaic
        Verify(view, .setAmounts(amounts: .value(["0 XEM"])))

        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setAmounts(amounts: .value(["0 XEM", "0 ttech:ryuta"])))

        presenter.didChangeAmountPage(1)

        presenter.didChangeFormula("10")
        presenter.didCalculateFormula(10)

        Verify(view, .setAmounts(amounts: .value(["0 XEM", "10 ttech:ryuta"])))

        presenter.didDeselectMosaicOwned(mosaics[0]) // deselect mosaic
        Verify(view, .setAmounts(amounts: .value(["0 XEM"])))

        presenter.didSelectMosaicOwned(mosaics[0]) // clear mosaic amount
        Verify(view, .setAmounts(amounts: .value(["0 XEM", "0 ttech:ryuta"])))


        presenter.didChangeMosaicWithXem(false)
        Verify(view, .setAmounts(amounts: .value(["0 ttech:ryuta"])))

        presenter.didDeselectMosaicOwned(mosaics[0]) // clear list results in only xem.
        Verify(view, .setAmounts(amounts: .value(["0 XEM"])))
    }
}

