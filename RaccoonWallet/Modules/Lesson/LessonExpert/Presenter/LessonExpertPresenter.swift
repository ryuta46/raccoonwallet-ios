//
//  LessonExpertPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/23.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

class LessonExpertPresenter : BasePresenter {
    weak var view: LessonExpertView?
    var interactor: LessonExpertUseCase!
    var router: LessonExpertWireframe!
}

extension LessonExpertPresenter : LessonExpertPresentation {
    func didClickOk() {
        router.presentBackup()
    }
}

extension LessonExpertPresenter : LessonExpertInteractorOutput {
    
}
