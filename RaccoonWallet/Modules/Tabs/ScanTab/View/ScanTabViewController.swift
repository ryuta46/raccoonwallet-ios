//
//  ScanTabViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/09/08.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class ScanTabViewController: BaseViewController {
    var presenter: ScanTabPresentation! { didSet {basePresenter = presenter} }

    var loadingView: FullScreenLoadingView!

    var isPausedScan: Bool = false

    @IBOutlet weak var scannerView: QrScannerView!

    override func setup() {
        super.setup()

        loadingView = createFullScreenLoadingView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.title = ""
    }
}

extension ScanTabViewController: ScanTabView {
    func startScan() {
        scannerView.startCapture(
                onAddress: { [weak self] address in
                    guard let weakSelf = self,
                          !weakSelf.isPausedScan else {
                        return
                    }
                    weakSelf.presenter.didScanAddress(address)
                },
                onInvoice: { [weak self] invoice in
                    guard let weakSelf = self,
                          !weakSelf.isPausedScan else {
                        return
                    }
                    weakSelf.presenter.didScanInvoice(invoice)
                },
                onError: {self.presenter.didCatchError($0)})

        isPausedScan = false
    }

    func stopScan() {
        scannerView.stopCapture()
    }

    func showLoading() {
        loadingView.startLoading()
    }

    func hideLoading() {
        loadingView.stopLoading()
    }
    func pause(_ isPaused: Bool) {
        isPausedScan = isPaused
    }

    func showNotSetPinError() {
        let dialog = MessageDialogPreset.createErrorNotSetPin { result in

            if result == .ok {
                self.presenter.didClickGoPinSetting()
            } else {
                self.pause(false)
            }
        }
        navigationController?.present(dialog, animated: true)
    }

    func showNotSelectWalletError() {
        let dialog = MessageDialogPreset.createErrorNotSelectWallet { result in
            if result == .ok {
                self.presenter.didClickGoWalletSelect()
            } else {
                self.pause(false)
            }
        }
        navigationController?.present(dialog, animated: true)
    }
}
