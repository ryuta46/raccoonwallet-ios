//
//  LessonEndPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class LessonEndPresenter: BasePresenter {
    weak var view: LessonEndView?
    var interactor: LessonEndUseCase!
    var router: LessonEndWireframe!
    var level: LessonLevel!

    override func viewDidLoad() {
        view?.showText(level)
    }
}

extension LessonEndPresenter: LessonEndPresentation {
    func didClickOk() {
        router.goBackHome()
    }
}

extension LessonEndPresenter: LessonEndInteractorOutput {
    
}
