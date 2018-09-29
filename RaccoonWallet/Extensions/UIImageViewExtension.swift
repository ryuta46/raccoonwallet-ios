//
//  UIImageViewExtension.swift
//  RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/28.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import UIKit
import ZXingObjC

extension UIImageView {

    func setQrText(_ qrText: String) {
        let hints = ZXEncodeHints()

        let scale = UIScreen.main.scale
        if let writer = ZXMultiFormatWriter.writer() as? ZXMultiFormatWriter{
            let result = try? writer.encode(qrText,
                    format: kBarcodeFormatQRCode,
                    width: Int32(bounds.width * scale),
                    height: Int32(bounds.height * scale),
                    hints: hints)

            if result != nil {
                image = UIImage(cgImage: ZXImage.init(matrix: result).cgimage)
            }
        }


    }
}