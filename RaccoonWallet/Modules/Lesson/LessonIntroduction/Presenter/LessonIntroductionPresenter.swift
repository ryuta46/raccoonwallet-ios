//
//  LessonIntroductionPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class LessonIntroductionPresenter: BasePresenter{
    weak var view: LessonIntroductionView?
    var interactor: LessonIntroductionUseCase!
    var router: LessonIntroductionWireframe!
}

extension LessonIntroductionPresenter: LessonIntroductionPresentation {
    func didClickOk() {
        router.presentLessonLevel()
    }
}

extension LessonIntroductionPresenter : LessonIntroductionInteractorOutput {
    
}
