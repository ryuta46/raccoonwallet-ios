//
// Created by Taizo Kusuda on 2018/09/17.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import UIKit
import ZXingObjC
import AVFoundation


class QrScannerView: UIView {
    var zxcapture: ZXCapture?

    var onAddress: ((String) -> Void)?
    var onInvoice: ((InvoiceQr) -> Void)?
    var onWallet: ((WalletQr) -> Void)?
    var onError: ((String) -> Void)?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
    }

    func startCapture(
            onAddress: ((String) -> Void)? = nil,
            onInvoice: ((InvoiceQr) -> Void)? = nil,
            onWallet: ((WalletQr) -> Void)? = nil,
            onError: ((String) -> Void)? = nil
    ) {
        // check if camera device is available
        guard AVCaptureDevice.default(for: .video) != nil else {
            onError?("No camera.")
            return
        }

        self.onAddress = onAddress
        self.onInvoice = onInvoice
        self.onWallet = onWallet
        self.onError = onError

        let status = AVCaptureDevice.authorizationStatus(for: .video)

        switch (status) {
        case .authorized: // ok
            startZXCapture()
        case .denied: // ng
            onError?("Denied to use camera")
        case .restricted: // ?
            startZXCapture()
        case .notDetermined:
            // first time
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { [weak self] (granted: Bool) -> () in
                guard let weakSelf = self else {
                    return
                }
                DispatchQueue.main.async {
                    guard granted else {
                        onError?("Denied to use camera")
                        return
                    }
                    weakSelf.startZXCapture()
                }
            })
        }

    }

    private func startZXCapture() {
        let zxcapture = ZXCapture()
        self.zxcapture = zxcapture
        zxcapture.delegate = self
        zxcapture.sessionPreset = AVCaptureSession.Preset.high.rawValue
        zxcapture.camera = zxcapture.back()

        //let captureView = UIViewController()
        zxcapture.layer.frame = bounds
        layer.addSublayer(zxcapture.layer)

        zxcapture.start()
    }
    func stopCapture() {
        zxcapture?.layer.removeFromSuperlayer()
        zxcapture?.stop()


    }
}


extension QrScannerView: ZXCaptureDelegate {
    func captureResult(_ capture: ZXCapture!, result: ZXResult!) {
        if (result.barcodeFormat != kBarcodeFormatQRCode){
            return;
        }

        if let text = result.text {
            guard let data = text.data(using: .utf8) else {
                return
            }
            if onInvoice != nil {
                if let invoice = try? JSONDecoder().decode(InvoiceQr.self, from: data) {
                    onInvoice?(invoice)
                    return
                }
            }

            if onWallet != nil {
                if let wallet = try? JSONDecoder().decode(WalletQr.self, from: data) {
                    onWallet?(wallet)
                    return
                }
            }

            if onAddress != nil {
                if text.count == Constant.addressLength && (text.starts(with: "N") || text.starts(with: "T")){
                    onAddress?(text)
                    return
                }
            }
        }
    }
}
