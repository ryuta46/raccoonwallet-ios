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


    func testDidChangeFormula() {
        Perform(view, .setSendMosaicDescriptions(mosaicDescriptions: .any([SendMosaicDescription].self), perform: { (mosaicDescriptions) in print(mosaicDescriptions.map { $0.amount})}))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, divisibility: 0, description: "description")]
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
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "5 + 4 ttech:ryuta", localCurrency: nil, balance: nil)
         ]

        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value(expected)))
    }

    func testDidCalculateFormula() {
        Perform(view, .setSendMosaicDescriptions(mosaicDescriptions: .any([SendMosaicDescription].self), perform: { (mosaicDescriptions) in print(mosaicDescriptions.map { $0.amount})}))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // pages are [xem , mosaic].

        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeMosaicWithXem(true) // and with xem

        // set page index 1
        presenter.didChangeAmountPage(1)

        // set formula
        let expected = [
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "90 ttech:ryuta", localCurrency: nil, balance: nil)
        ]

        presenter.didChangeFormula("90")

        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value(expected)))

        // Formula is used
        presenter.didCalculateFormula(100)
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value(expected)))
    }


    func testDidConfirm() {
        var transaction = SendTransaction(address: "test", publicKey: nil)
        presenter.sendTransaction = transaction

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // pages are [xem , mosaic].
        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        presenter.didChangeMosaicWithXem(true) // and with xem

        // set page index 1
        presenter.didChangeAmountPage(1)

        // set value
        let expected = [
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "100 ttech:ryuta", localCurrency: nil, balance: nil)
        ]
        presenter.didChangeFormula("100")
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value(expected)))

        presenter.didCalculateFormula(100)
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value(expected)))

        presenter.didConfirm()

        transaction.mosaics = [
            MosaicDetail.xem(0),
            mosaics[0].replaced(quantity: 100)
        ]

        Verify(router, .presentSendMode(sendTransaction: .value(transaction)))
    }

    func testDidChangeMosaicWithXem() {
        Perform(view, .setSendMosaicDescriptions(mosaicDescriptions: .any([SendMosaicDescription].self), perform: { (mosaicDescriptions) in print(mosaicDescriptions.map { $0.amount})}))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        // default is not with xem
        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeMosaicWithXem(true) // with xem
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))


        presenter.didChangeMosaicWithXem(false) // not with xem
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeMosaicWithXem(true) // with xem
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeAmountPage(0)

        presenter.didChangeFormula("10")
        presenter.didCalculateFormula(10)

        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "10 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeMosaicWithXem(false)
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeMosaicWithXem(true) // xem amount is clear
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))
    }

    func testDidClickMosaicOwned() {
        Perform(view, .setSendMosaicDescriptions(mosaicDescriptions: .any([SendMosaicDescription].self), perform: { (mosaicDescriptions) in print(mosaicDescriptions.map { $0.amount})}))

        // default is only xem
        presenter.viewDidLoad()
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil)
        ])))

        let mosaics = [MosaicDetail(namespace: "ttech", mosaic: "ryuta", quantity: 10, divisibility: 0, description: "description")]
        presenter.mosaicOwnedFetched(mosaics)

        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeMosaicWithXem(true) // with xem
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didDeselectMosaicOwned(mosaics[0]) // deselect mosaic
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil)
        ])))

        presenter.didSelectMosaicOwned(mosaics[0]) // select mosaic
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didChangeAmountPage(1)

        presenter.didChangeFormula("10")
        presenter.didCalculateFormula(10)

        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "10 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didDeselectMosaicOwned(mosaics[0]) // deselect mosaic
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil)
        ])))

        presenter.didSelectMosaicOwned(mosaics[0]) // clear mosaic amount
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil),
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))


        presenter.didChangeMosaicWithXem(false)
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 ttech:ryuta", localCurrency: nil, balance: nil)
        ])))

        presenter.didDeselectMosaicOwned(mosaics[0]) // clear list results in only xem.
        Verify(view, .setSendMosaicDescriptions(mosaicDescriptions: .value([
            SendMosaicDescription(amount: "0 XEM", localCurrency: nil, balance: nil)
        ])))
    }
}

