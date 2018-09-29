//
//  TransactionListRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class TransactionListRouter: TransactionListWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = R.storyboard.transactionListStoryboard.transactionListView()!
        let presenter = TransactionListPresenter()
        let interactor = TransactionListInteractor()
        let router = TransactionListRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func presentTransactionDetail(_ transaction: TransferTransactionDetail) {
        viewController?.pushWithNavigation(TransactionDetailRouter.assembleModule(transaction))
    }
}

