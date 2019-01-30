//
// Created by Taizo Kusuda on 2018/09/04.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import NemSwift

protocol NemServiceBalanceOutput: class {
    func balanceFetched(_ microXem: UInt64)
    func balanceFetchFailed(_ error: Error)
}

protocol NemServiceTransactionOutput: class {
    func transactionFetched(_ transactions: [TransactionMetaDataPair])
    func transactionFetchFailed(_ error: Error)
}

protocol NemServiceMosaicOwnedOutput: class {
    func mosaicOwnedFetched(_ mosaics: [MosaicDetail])
    func mosaicOwnedFetchFailed(_ error: Error)
}

protocol NemServiceMosaicDefinitionOutput: class {
    func mosaicDefinitionFetched(_ mosaicDefinition: MosaicDefinition)
    func mosaicDefinitionFetchFailed(_ error: Error)
}

protocol NemServiceHarvestOutput: class {
    func harvestFetched(_ harvests: [Harvest])
    func harvestFetchFailed(_ error: Error)
}

protocol NemServicePublicKeyOutput: class {
    func publicKeyFetched(_ publicKey: String?)
    func publicKeyFetchFailed(_ error: Error)
}

protocol NemServiceAccountOutput: class {
    func accountFetched(_ account: AccountMetaDataPair)
    func accountFetchFailed(_ error: Error)
}

protocol NemServiceSendTransactionOutput: class {
    func transactionSent(_ result: NemAnnounceResult)
    func transactionSendFailed(_ error: Error)
}

protocol NemServiceTransferTransactionDetailOutput: class {
    func transferTransactionDetailFetched(_ transactions: [TransferTransactionDetail])
    func transferTransactionDetailFetchFailed(_ error: Error)
}

protocol NemServiceNamespaceOutput: class {
    func namespaceFetched(_ namespace: Namespace)
    func namespaceFetchFailed(_ error: Error)
}


protocol NemServiceUseCase {
}

extension NemServiceUseCase where Self: RxDisposable {
    func fetchBalance(_ address: String, _ output: NemServiceBalanceOutput) {
        NemService
                .fetchBalance(address)
                .subscribe(
                        onSuccess: { balance in output.balanceFetched(balance) },
                        onError: { error in output.balanceFetchFailed(error) }
                )
                .disposed(by: disposeBag)
    }


    func fetchMosaicOwned(_ address: String, _ output: NemServiceMosaicOwnedOutput, noUseCache: Bool = false, fetchesSupply: Bool = false) {
        NemService
                .fetchMosaicOwnedWithDefinition(address, noUseCache: noUseCache, fetchesSupply: fetchesSupply)
                .subscribe(
                        onSuccess: { mosaics in output.mosaicOwnedFetched(mosaics) },
                        onError: { error in output.mosaicOwnedFetchFailed(error) }
                )
                .disposed(by: disposeBag)

    }

    func fetchTransaction(_ address: String, _ output: NemServiceTransactionOutput) {
        NemService
                .fetchTransaction(address)
                .subscribe(
                        onSuccess: { transactions in output.transactionFetched(transactions) },
                        onError: { error in output.transactionFetchFailed(error) }
                )
                .disposed(by: disposeBag)

    }

    func fetchTransferTransactionDetail(_ address: String,
                                        _ output: NemServiceTransferTransactionDetailOutput,
                                        withUnconfirmed: Bool,
                                        id: Int? = nil) {
        NemService
                .fetchTransferTransactionDetail(address, withUnconfirmed: withUnconfirmed, id: id)
                .subscribe(
                        onSuccess: { transactions in output.transferTransactionDetailFetched(transactions) },
                        onError: { error in output.transferTransactionDetailFetchFailed(error) }
                )
                .disposed(by: disposeBag)
    }

    func fetchHarvest(_ address: String, _ output: NemServiceHarvestOutput) {
        NemService
                .fetchHarvest(address)
                .subscribe(
                        onSuccess: { harvests in output.harvestFetched(harvests.data)},
                        onError: { error in output.harvestFetchFailed(error)}
                )
                .disposed(by: disposeBag)
    }

    func fetchPublicKey(_ address: String, _ output: NemServicePublicKeyOutput) {
        NemService
                .fetchAccount(address)
                .subscribe(
                        onSuccess: { account in output.publicKeyFetched(account.account.publicKey)},
                        onError: { error in output.publicKeyFetchFailed(error)}
                )
                .disposed(by: disposeBag)
    }

    func fetchAccount(_ address: String, _ output: NemServiceAccountOutput) {
        NemService
                .fetchAccount(address)
                .subscribe(
                        onSuccess: { account in output.accountFetched(account) },
                        onError: { error in output.accountFetchFailed(error) }
                )
                .disposed(by: disposeBag)
    }

    func sendTransaction(_ request: [UInt8], _ keyPair: KeyPair, _ output: NemServiceSendTransactionOutput) {
        NemService
                .sendTransaction(request, keyPair)
                .subscribe(
                        onSuccess: { result in output.transactionSent(result)},
                        onError: { error in output.transactionSendFailed(error)}
                )
                .disposed(by: disposeBag)
    }

    func fetchNamespace(_ namespace: String, _ output: NemServiceNamespaceOutput) {
        NemService
                .fetchNamespace(namespace)
                .subscribe(
                        onSuccess: { result in output.namespaceFetched(result)},
                        onError: { error in output.namespaceFetchFailed(error)}
                )
                .disposed(by: disposeBag)
    }
}

class NemServiceInteractor: RxDisposable, NemServiceUseCase {

}
