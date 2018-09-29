//
//  DonationTopPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/11.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class DonationTopPresenter: BasePresenter {
    weak var view: DonationTopView?
    var interactor: DonationTopUseCase!
    var router: DonationTopWireframe!
}

extension DonationTopPresenter: DonationTopPresentation {
    func didClickDeveloper(_ developer: Developer) {
        router.presentDonationDetail(developer)
    }
}

extension DonationTopPresenter: DonationTopInteractorOutput {
}
