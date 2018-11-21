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
    var selectedMosaics: [MosaicDetail] = []
    var selectedNonXemMosaics: [MosaicDetail] {
        return selectedMosaics.filter { !$0.isXem() }
    }
    var isXemSelected: Bool {
        return selectedMosaics.contains { $0.isXem() }
    }
    var ownedMosaics: [MosaicDetail] = []
    var activePageIndex: Int = 0
    var activeFormula: String = "0"
    var mosaicWithXem: Bool = false
    var currentAddress: String = ""

    private var mosaicAmountDescriptions: [String] {
        return selectedMosaics.enumerated().map {
            let index = $0.0
            let mosaic = $0.1
            if index == activePageIndex {
                if mosaic.isXem() {
                    return activeFormula + " XEM"
                } else {
                    return activeFormula + " \(mosaic.identifier)"
                }
            } else {
                return mosaic.amountDescription
            }
        }
    }

    override func viewDidLoad() {
        view?.showAmount()
        selectedMosaics = [MosaicDetail.xem(0)]
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
        view?.setAmounts(mosaicAmountDescriptions)
    }

    func didChangeFormula(_ formula: String) {
        activeFormula = formula
        view?.setAmounts(mosaicAmountDescriptions)
    }
    func didCalculateFormula(_ value: Decimal) {
        if let activeMosaic = selectedMosaics[safe: activePageIndex] {
            selectedMosaics[activePageIndex] = activeMosaic.replaced(amount: value)
            view?.setAmounts(mosaicAmountDescriptions)
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
        view?.setAmounts(mosaicAmountDescriptions)
        view?.showFirstAmountPage()
        view?.setFormula(activeFormula)
    }

}

extension SendAmountPresenter : SendAmountInteractorOutput {
    func mosaicOwnedFetched(_ mosaics: [MosaicDetail]) {
        ownedMosaics = mosaics.filter { !$0.isXem() }
        
        view?.showMosaicOwned(ownedMosaics, selected: selectedMosaics)
        view?.hideMosaicWithXem(animated: false)
    }

    func mosaicOwnedFetchFailed(_ error: Error) {
        view?.showError(R.string.localizable.common_error_network())
    }
}
