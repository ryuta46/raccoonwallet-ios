//
//  QrScannerDialogViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/25.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class QrScannerDialogViewController: BaseViewController {
    var presenter: QrScannerDialogPresentation! { didSet { basePresenter = presenter } }

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var scannerView: QrScannerView!
    @IBOutlet weak var cancel: UIBarButtonItem!


    override func setup() {
        super.setup()

        navigationBar.topItem?.title = R.string.localizable.common_qr_import()
        cancel.customView = createBarButton(image: R.image.icon_close()!, size: Constant.barIconSize, action: #selector(onTouchedCancel(_:)))

    }

    @objc func onTouchedCancel(_ sender: Any) {
        presenter.didClickCancel()
    }
}

extension QrScannerDialogViewController: QrScannerDialogView {
    func startCapture() {

        scannerView.startCapture(
                onAddress: { self.presenter.didScanAddress($0) },
                onInvoice: { self.presenter.didScanInvoice($0) },
                onWallet: { self.presenter.didScanWallet($0) },
                onError: { self.presenter.didCatchError($0) })
    }
    func stopCapture() {
        scannerView.stopCapture()
    }
}


