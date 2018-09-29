//
//  MosaicDetailRouter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit

class MosaicDetailRouter: MosaicDetailWireframe {
    weak var viewController: UIViewController?
    
    static func assembleModule(_ mosaic: MosaicImageUrl) -> UIViewController {
        let view = R.storyboard.mosaicDetailStoryboard.mosaicDetailView()!
        let presenter = MosaicDetailPresenter()
        let interactor = MosaicDetailInteractor()
        let router = MosaicDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        presenter.mosaic = mosaic
        
        interactor.output = presenter
        
        router.viewController = view
        return view
    }

    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}

