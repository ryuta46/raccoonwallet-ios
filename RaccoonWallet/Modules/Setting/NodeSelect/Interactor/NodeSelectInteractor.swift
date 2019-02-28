//
//  NodeSelectInteractor.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/13
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift

class NodeSelectInteractor: NodeSelectUseCase {
    weak var output: NodeSelectInteractorOutput!

    let disposeBag = DisposeBag()

    func fetchNodes() {

        /*
        NemNodesService
                .nodes()
                .subscribe(
                        onSuccess: { nodes in self.output.nodesFetched(nodes) },
                        onError: { error in self.output.nodesFetchFailed(error) }
                )
                .disposed(by: disposeBag)
                */

        XEMBookService
                .activeNodeList()
                .subscribe(
                        onSuccess: { activeNodes in
                            self.output.nodesFetched(activeNodes.http.map { host in
                                NemNode(ip: host, nisPort: 7890)
                            })
                        },
                        onError: { error in self.output.nodesFetchFailed(error) }
                ).disposed(by: disposeBag)
    }
}
