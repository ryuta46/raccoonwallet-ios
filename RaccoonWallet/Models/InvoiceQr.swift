//
// InvoiceQr.swift
// RaccoonWallet
//
// Created by Taizo Kusuda on 2018/08/25.
// Copyright (c) 2018 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

struct InvoiceQr: Codable {
    let v: Int
    let type: Int
    let data: InvoiceQrInner

    static func fromAddress(address: String) -> InvoiceQr {
        return InvoiceQr(
                v: 2,
                type: 2,
                data: InvoiceQrInner(
                        addr: address,
                        name: "",
                        amount: 0,
                        msg: "")
        )
    }

    static func fromXemAmount(address: String, xem: Decimal) -> InvoiceQr {
        let microXem = ((xem * pow(Decimal(10), Int(Currency.xem.precision))).round() as NSDecimalNumber).uint64Value
        return fromXemQuantity(address: address, microXem: microXem)
    }

    static func fromXemQuantity(address: String, microXem: UInt64) -> InvoiceQr {
        return InvoiceQr(
                v: 2,
                type: 2,
                data: InvoiceQrInner(
                        addr: address,
                        name: "",
                        amount: microXem,
                        msg: "")
        )
    }


    func toJson() -> String? {
        let encoder = JSONEncoder()
        guard let encodedData = try? encoder.encode(self) else {
            return nil
        }
        return String(data: encodedData, encoding: .utf8)

    }

}

struct InvoiceQrInner: Codable {
    let addr: String
    let name: String?
    let amount: UInt64?
    let msg: String?
}