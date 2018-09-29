//
//  NemService.swift?
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/14.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import APIKit
import NemSwift
import RxSwift

class NemService {
    static var nis: URL {
        get {
            return NemSwiftConfiguration.defaultBaseURL
        }
        set(url) {
            NemSwiftConfiguration.defaultBaseURL = url
        }
    }

    static func fetchAccount(_ address: String) -> Single<AccountMetaDataPair> {
        return Session.rx_send(NISAPI.AccountGet(address: address))
    }

    static func fetchBalance(_ address: String) -> Single<UInt64> {
        return Session.rx_send(NISAPI.AccountGet(address: address)).map({ (accountMedatDataPair) -> UInt64 in
            return UInt64(accountMedatDataPair.account.balance)
        })
    }

    static func fetchMosaicOwned(_ address: String) -> Single<[Mosaic]> {
        return Session.rx_send(NISAPI.AccountMosaicOwned(address: address)).map({ mosaics in
            return mosaics.data
        })
    }

    static func fetchMosaicOwnedWithDefinition(_ address: String, noUseCache: Bool = false) -> Single<[MosaicDetail]> {
        return fetchMosaicOwned(address)
            .map { fetchMosaicDetails(from: $0, noUseCache: noUseCache) }
                .flatMap {$0}

    }

    static func fetchMosaicDetails(from mosaics: [Mosaic], noUseCache: Bool = false) -> Single<[MosaicDetail]>{
        var requests: [Single<[MosaicDetail]>] = []
        var rest: [Mosaic] = []

        for mosaic in mosaics {
            // filter nem:xem request
            if mosaic.mosaicId.isXem {
                let request = getXemDetail(of: UInt64(mosaic.quantity)).map { [$0] }
                requests.append(request)
            } else if !noUseCache, // use cache
                let cached = MosaicDefinitionCache.shared.getCached(with: mosaic.mosaicId.description),
                let mosaicDetail = getMosaicDetail(of: mosaic, in: [cached]) {

                let request = getMosaicDetailSingle(mosaicDetail).map { [$0] }
                requests.append(request)
            } else {
                rest.append(mosaic)
            }
        }

        while(!rest.isEmpty) {
            // gather mosaics in same namespace
            let namespace = rest[0].mosaicId.namespaceId

            let sameNamespaceMosaics = rest.filter { mosaic in mosaic.mosaicId.namespaceId == namespace }

            let request = fetchMosaicDefinitions(namespace, sameNamespaceMosaics.map {$0.mosaicId.name})
                .map { mosaicDefinitions in
                    return sameNamespaceMosaics.compactMap { mosaic in
                        getMosaicDetail(of: mosaic, in: mosaicDefinitions)
                    }
            }
            requests.append(request)

            rest = rest.filter { mosaic in mosaic.mosaicId.namespaceId != namespace }
        }

        return Single.zip(requests).map { $0.reduce([]) { (result, element) -> [MosaicDetail] in result + element }}
    }
    private static func getXemDetail(of quantity: UInt64) -> Single<MosaicDetail> {
        return Single.create(subscribe: { observer in
            observer(.success(MosaicDetail.xem(quantity)))
            return Disposables.create()
        })
        
    }
    
    private static func getMosaicDetailSingle(_ mosaicDetail: MosaicDetail ) -> Single<MosaicDetail> {
        return Single.create(subscribe: { observer in
            observer(.success(mosaicDetail))
            return Disposables.create()
        })
    }


    private static func getMosaicDetail(of mosaic: Mosaic, in mosaicDefinitions: [MosaicDefinition]) -> MosaicDetail? {
        guard let definition = mosaicDefinitions.first(where: { definition in mosaic.mosaicId.name == definition.id.name }) else {
            return nil
        }

        guard let supply = definition.initialSupply,
              let divisibility = definition.divisibility else {
            return nil
        }
        return MosaicDetail(
                namespace: mosaic.mosaicId.namespaceId,
                mosaic: mosaic.mosaicId.name,
                quantity: UInt64(mosaic.quantity),
                supply: supply,
                divisibility: divisibility,
                description: definition.description
        )
    }


    // fetch mosaic definition in same namespace
    static func fetchMosaicDefinitions(_ namespace: String, _ names: [String], pageSize: Int? = nil) -> Single<[MosaicDefinition]> {
        let resultQueue = PublishSubject<[MosaicDefinitionMetaDataPair]>()

        return Single.create { observer in
            let disposeBag = DisposeBag()
            var rest = names
            var results: [MosaicDefinition] = []

            resultQueue.subscribe(
                    onNext: { mosaicDefinitions in
                        if mosaicDefinitions.isEmpty {
                            // not found in the namespace
                            observer(.error(NSError(domain: "No matched mosaic in the namespace.", code: 0)))
                            return
                        }

                        for mosaicDefinition in mosaicDefinitions {
                            let name = mosaicDefinition.mosaic.id.name
                            if (rest.contains(name)) {
                                // save to cache
                                MosaicDefinitionCache.shared.cache(definition: mosaicDefinition.mosaic)

                                results.append(mosaicDefinition.mosaic)

                                rest.remove(at: rest.index(of: name)!)

                                if rest.isEmpty { // Succeeded to gather all mosaic definitions
                                    observer(.success(results))
                                    return
                                }
                            }
                        }

                        fetchMosaicDefinition(namespace, id: mosaicDefinitions.last!.meta.id, pageSize: pageSize).subscribe(
                                onSuccess: { result in
                                    resultQueue.onNext(result)
                                },
                                onError: { error in
                                    observer(.error(error))
                                }
                        ).disposed(by: disposeBag)
                    },
                    onError: { error in
                        observer(.error(error))

                    }
            ).disposed(by: disposeBag)

            fetchMosaicDefinition(namespace, id: nil, pageSize: pageSize).subscribe(
                    onSuccess: { result in
                        resultQueue.onNext(result)
                    },
                    onError: { error in
                        observer(.error(error))
                    }
            ).disposed(by: disposeBag)

            return Disposables.create {
            }
        }
    }


    static func fetchMosaicDefinition(_ namespace: String, id: Int? = nil, pageSize: Int? = nil) -> Single<[MosaicDefinitionMetaDataPair]> {
        return Session.rx_send(NISAPI.NamespaceMosaicDefintionPage(namespace: namespace, id: id, pageSize: pageSize)).map { definitions in
            definitions.data
        }
    }

    static func sendTransaction(_ request: [UInt8], _ keyPair: KeyPair) -> Single<NemAnnounceResult> {
        return Session.rx_send(NISAPI.TransactionAnnounce(requestAnnounce: request, keyPair: keyPair))
    }

    static func fetchTransaction(_ address: String, id: Int? = nil) -> Single<[TransactionMetaDataPair]> {
        return Session.rx_send(NISAPI.AccountTransfersAll(address: address, id: id)).map({ transactions in
            return transactions.data
        })
    }

    static func fetchUnconfirmedTransaction(_ address: String) -> Single<[UnconfirmedTransactionMetaDataPair]> {
        return Session.rx_send(NISAPI.AccountUnconfirmedTransactions(address: address)).map({ transactions in
            return transactions.data
        })
    }


    static func fetchTransferTransactionDetail(_ address: String, withUnconfirmed: Bool, id: Int? = nil) -> Single<[TransferTransactionDetail]> {

        let confirmed = fetchTransaction(address, id: id)
        let unconfirmed = withUnconfirmed ? fetchUnconfirmedTransaction(address) : Single<[UnconfirmedTransactionMetaDataPair]>.create { observer in
            observer(.success([]))
            return Disposables.create()
        }

        return Single.zip(confirmed, unconfirmed)
                .flatMap { (transactions: [TransactionMetaDataPair], unconfirmedTransactions: [UnconfirmedTransactionMetaDataPair])
                                -> (Single<[TransferTransactionDetail]>) in
                    // gather mosaic definitions
                    var definitionNeedMosaics: Dictionary<String, [String]> = [:]
                    var cachedDefinitions: [MosaicDefinition] = []

                    let allTransactions = transactions.map {$0.transaction} + unconfirmedTransactions.map {$0.transaction}
                    for transaction in allTransactions {
                        if let mosaics = transaction.mosaics ?? transaction.otherTrans?.mosaics {
                            for mosaic in mosaics {
                                let namespace = mosaic.mosaicId.namespaceId
                                let name = mosaic.mosaicId.name

                                if mosaic.mosaicId.isXem {
                                    continue
                                }
                                if let cachedDefinition = MosaicDefinitionCache.shared.getCached(with: mosaic.mosaicId.description) {
                                    if !cachedDefinitions.contains(where: { definition in definition.id.description == cachedDefinition.id.description } ) {
                                        cachedDefinitions.append(cachedDefinition)
                                    }
                                    continue
                                }
                                
                                if let names = definitionNeedMosaics[namespace] {
                                    if !names.contains(name) {
                                        definitionNeedMosaics.updateValue(names + [name], forKey: namespace)
                                    }
                                } else {
                                    definitionNeedMosaics[namespace] = [name]
                                }
                            }
                        }
                    }

                    // fetch mosaic definition
                    return Single.zip(definitionNeedMosaics.map { (namespace, names) in
                        fetchMosaicDefinitions(namespace, names)
                    }).map { (mosaicDefinitions: [[MosaicDefinition]]) -> [TransferTransactionDetail] in
                        // flat [[MosaicDefinition]] -> [MosaicDefinition]
                        let definitions = mosaicDefinitions.reduce([]) {(result, element) in result + element} + cachedDefinitions
                        // composite them
                        let confirmed = transactions
                                .map { transaction in
                                    TransferTransactionDetail(
                                            transaction.transaction,
                                            id: transaction.meta.id,
                                            hash: transaction.meta.hash.data,
                                            block: transaction.meta.height,
                                            ownerAddress: address, mosaicDefinitions: definitions)
                                }

                        let unconfirmed = unconfirmedTransactions
                                .map { transaction in
                                    TransferTransactionDetail(
                                            transaction.transaction,
                                            id: nil,
                                            hash: nil,
                                            block: nil,
                                            ownerAddress: address, mosaicDefinitions: definitions)
                                }
                        return (unconfirmed + confirmed).compactMap { $0 }
                    }
                }
    }
}
