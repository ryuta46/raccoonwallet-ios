//
//  SendAmountPresenter.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/03.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation


class SendAmountPresenter : BasePresenter {
    weak var view: SendAmountView?
    var interactor: SendAmountUseCase!
    var router: SendAmountWireframe!
    var sendTransaction: SendTransaction!
    private var selectedMosaics: [MosaicDetail] = []
    private var selectedNonXemMosaics: [MosaicDetail] {
        return selectedMosaics.filter { !$0.isXem() }
    }
    private var isXemSelected: Bool {
        return selectedMosaics.contains { $0.isXem() }
    }
    private var ownedXem: MosaicDetail? = nil
    private var ownedMosaics: [MosaicDetail] = []
    private var activePageIndex: Int = 0
    private var activeFormula: String = "0"
    private var mosaicWithXem: Bool = false
    private var currentAddress: String = ""


    private var localCurrencyRate: Decimal? = nil
    // TODO: How to decide this ?
    private let localCurrency = Currency.jpy

    private var mosaicDescriptions: [SendMosaicDescription] {
        return selectedMosaics.enumerated().map {
            let index = $0.0
            let mosaic = $0.1

            let amountDescription: String

            if index == activePageIndex {
                if mosaic.isXem() {
                    amountDescription = activeFormula + " XEM"
                } else {
                    amountDescription = activeFormula + " \(mosaic.identifier)"
                }
            } else {
                amountDescription = mosaic.amountDescription
            }

            let balanceDescription: String?
            let localCurrencyDescription: String?
            if mosaic.isXem() {
                balanceDescription = ownedXem?.amountDescription
                if let rate = localCurrencyRate {
                    let localCurrencyValue = (mosaic.amount * rate).round(localCurrency.precision)
                    localCurrencyDescription = "= \(localCurrencyValue.description) \(localCurrency.rawValue)"
                } else {
                    localCurrencyDescription = nil
                }

            } else {
                balanceDescription = ownedMosaics.first(where: { $0.identifier == mosaic.identifier })?.amountDescription
                localCurrencyDescription = nil
            }

            return SendMosaicDescription(
                    amount: amountDescription,
                    localCurrency: localCurrencyDescription,
                    balance: balanceDescription)
        }
    }

    override func viewDidLoad() {
        view?.showAmount()
        selectedMosaics = [MosaicDetail.xem(0)]
        interactor.fetchRate(localCurrency)
    }

    override func viewWillAppear() {
        if let wallet = WalletHelper.activeWallet {
            if currentAddress == wallet.address {
                return
            }
        }

        let xem = selectedMosaics.first(where: {mosaicDetail in mosaicDetail.isXem()}) ?? MosaicDetail.xem(0)
        selectedMosaics = [xem]
        fetchMosaicOwned()
    }
    
    private func fetchMosaicOwned() {
        syncAmountsWithView()
        if let wallet = WalletHelper.activeWallet {
            currentAddress = wallet.address
            view?.showLoading()
            interactor.fetchMosaicOwned(wallet.address)
        } else {
            view?.showError(R.string.localizable.wallet_not_select_message())
        }
    }
}

extension SendAmountPresenter : SendAmountPresentation {

    func didClickMosaicTab() {
        view?.showMosaic()
    }

    func didClickAmountTab() {
        view?.showAmount()
    }

    func didChangeAmountPage(_ pageIndex: Int) {
        activePageIndex = pageIndex
        if let activeMosaic = selectedMosaics[safe: pageIndex] {
            // reset formula
            activeFormula = activeMosaic.amount.description
            view?.setFormula(activeFormula)
        }
        view?.setSendMosaicDescriptions(mosaicDescriptions)
    }

    func didChangeFormula(_ formula: String) {
        activeFormula = formula
        view?.setSendMosaicDescriptions(mosaicDescriptions)
    }
    func didCalculateFormula(_ value: Decimal) {
        if let activeMosaic = selectedMosaics[safe: activePageIndex] {
            selectedMosaics[activePageIndex] = activeMosaic.replaced(amount: value)
            view?.setSendMosaicDescriptions(mosaicDescriptions)
        }
    }

    func didConfirm() {
        sendTransaction.mosaics = selectedMosaics
        router.presentSendMode(sendTransaction)
    }

    func didChangeMosaicWithXem(_ withXem: Bool) {
        mosaicWithXem = withXem
        if withXem {
            if isXemSelected {
                return
            }
            selectedMosaics.append(MosaicDetail.xem(0))
        } else {
            if isXemSelected && selectedMosaics.count > 1 {
                selectedMosaics = selectedMosaics.filter {!$0.isXem()}
            }
        }
        syncAmountsWithView()
    }

    func didSelectMosaicOwned(_ mosaic: MosaicDetail) {
        guard !selectedMosaics.contains(where: { $0.identifier == mosaic.identifier}) else {
            return
        }

        selectedMosaics.append((mosaic.replaced(quantity: 0)))
        if isXemSelected && !mosaicWithXem {
            selectedMosaics = selectedNonXemMosaics
        }
        syncAmountsWithView()

        view?.showMosaicWithXem()
    }

    func didDeselectMosaicOwned(_ mosaic: MosaicDetail) {
        guard selectedMosaics.contains(where: { $0.identifier == mosaic.identifier}) else {
            return
        }

        selectedMosaics = selectedMosaics.filter { $0.identifier != mosaic.identifier }
        // if no mosaic is selected, add xem as default
        if selectedMosaics.isEmpty {
            selectedMosaics.append(.xem(0))
        }
        syncAmountsWithView()

        if selectedNonXemMosaics.count == 0 {
            view?.hideMosaicWithXem(animated: true)
        }
    }


    private func sortSelectedMosaics() {
        selectedMosaics.sort {left, right in
            // xem first
            if left.isXem() {
                return true
            } else if right.isXem() {
                return false
            } else {
                return left.identifier < right.identifier
            }
        }
    }

    private func syncAmountsWithView() {
        sortSelectedMosaics()
        activePageIndex = 0
        activeFormula = selectedMosaics[0].amount.description
        view?.setSendMosaicDescriptions(mosaicDescriptions)
        view?.showFirstAmountPage()
        view?.setFormula(activeFormula)
    }

}

extension SendAmountPresenter : SendAmountInteractorOutput {
    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        ownedXem = mosaics.first(where: { $0.isXem() })
        ownedMosaics = mosaics.filter { !$0.isXem() }


        view?.setSendMosaicDescriptions(mosaicDescriptions)
        view?.showMosaicOwned(ownedMosaics, selected: selectedMosaics)
        view?.hideMosaicWithXem(animated: false)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        view?.showError(R.string.localizable.common_error_network())
    }
}

extension SendAmountPresenter : RateServiceInteractorOutput {
    func rateFetched(_ rate: Decimal) {
        localCurrencyRate = rate
        view?.setSendMosaicDescriptions(mosaicDescriptions)
    }

    func rateFetchFailed(_ error: Error) {
        view?.showError(R.string.localizable.common_error_network())
    }

}
