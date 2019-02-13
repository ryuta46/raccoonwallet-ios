//
//  QrLabInvoiceViewController.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/30.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit

class QrLabInvoiceViewController: BaseViewController {
    var presenter: QrLabInvoicePresentation! { didSet { basePresenter = presenter } }
    
    @IBOutlet weak var qr: UIImageView!
    
    @IBOutlet weak var amountHeadline: UILabel!
    @IBOutlet weak var xem: UILabel!
    @IBOutlet weak var localCurrency: UILabel!
    @IBOutlet weak var localCurrencyUnit: UILabel!
    @IBOutlet weak var addressHeadline: UILabel!
    @IBOutlet weak var address: UILabel!
    
    
    override func setup() {
        super.setup()
        title = "My Wallet QR"

        amountHeadline.text = R.string.localizable.common_amount()

        addressHeadline.text = R.string.localizable.common_destination()

        let done = UIBarButtonItem()
        done.customView = createBarButton(image: R.image.icon_check_green()!, size: Constant.barIconSize, action: #selector(onTouchedOk(_:)))
        navigationItem.setRightBarButton(done, animated: false)
    }

    @objc func onTouchedOk(_ sender: Any) {
        presenter.didClickOk()
    }
}

extension QrLabInvoiceViewController: QrLabInvoiceView {
    func showAmount(_ amount: String) {
        xem.text = amount
    }

    func showLocalCurrency(_ amount: String, _ unit: String) {
        localCurrency.text = amount
        localCurrencyUnit.text = unit
    }

    func showQr(_ invoiceQrJson: String) {
        qr.setQrText(invoiceQrJson)
    }

    func showAddress(_ address: String) {
        self.address.text = address
    }
}
