//
//  LessonLevelPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class LessonLevelPresenter : BasePresenter {
    weak var view: LessonLevelView?
    var interactor: LessonLevelUseCase!
    var router: LessonLevelWireframe!
}

extension LessonLevelPresenter : LessonLevelPresentation {
    func didClickBeginner() {
        router.presentBeginner()
    }
    
    func didClickImport() {
        router.presentImport()
    }
    
    func didClickExpert() {
        router.presentExpert()
    }
}

extension LessonLevelPresenter : LessonLevelInteractorOutput {
    
}
