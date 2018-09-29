//
//  MosaicDetailContract.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit


//sourcery: AutoMockable
protocol MosaicDetailView: BaseView {
    var presenter: MosaicDetailPresentation! { get set }

    func showImage(_ url: URL)
    func showText(_ namespace: String, _ name: String)
}

//sourcery: AutoMockable
protocol MosaicDetailPresentation: BasePresentation {
    var view: MosaicDetailView? { get set }
    var interactor: MosaicDetailUseCase! { get set }
    var router: MosaicDetailWireframe! { get set }

    func didClickOutside()
}

//sourcery: AutoMockable
protocol MosaicDetailUseCase: class {
    var output: MosaicDetailInteractorOutput! { get set }
}

//sourcery: AutoMockable
protocol MosaicDetailInteractorOutput: class {
}

//sourcery: AutoMockable
protocol MosaicDetailWireframe: class {
    var viewController: UIViewController? { get set }

    static func assembleModule(_ mosaic: MosaicImageUrl) -> UIViewController

    func dismiss()
}
