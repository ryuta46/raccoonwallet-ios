//
//  TransactionDetailRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/10.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class TransactionDetailRouter: TransactionDetailWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ transaction: TransferTransactionDetail) -> UIViewController {
        let view = R.storyboard.transactionDetailStoryboard.transactionDetailView()!
        let presenter = TransactionDetailPresenter()
        let interactor = TransactionDetailInteractor()
        let router = TransactionDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.transaction = transaction
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }
}

