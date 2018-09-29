//
//  SendAmountInteractorTest.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/04
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import XCTest
import SwiftyMocky
import NemSwift

@testable import RaccoonWallet


class SendAmountInteractorTest: BaseTestCase {
    var interactor: SendAmountInteractor!
    var interactorOutput: SendAmountInteractorOutputMock!

    override func setUp() {
        TestSettings.setUp()
        interactor = SendAmountInteractor()
        interactorOutput = SendAmountInteractorOutputMock()
        interactor.output = interactorOutput
    }

    func testFetchMosaicOwned() {
        block(5) {
            interactor.fetchMosaicOwned(TestSettings.address)
        }

        Verify(interactorOutput, .mosaicOwnedFetched(mosaics: .any([MosaicDetail].self)))
    }

    func testFetchMosaicFailed() {
        block(5) {
            interactor.fetchMosaicOwned("INVALID_ADDRESS")
        }

        Verify(interactorOutput, .mosaicOwnedFetchFailed(error: .any(Error.self)))
    }

}
