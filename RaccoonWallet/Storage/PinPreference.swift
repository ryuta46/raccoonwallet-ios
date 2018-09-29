//
//  PinPreference.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/20.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import KeychainAccess
import CryptoSwift

class PinPreference {
    static let shared = PinPreference()
    private let keychain: Keychain
    
    private static let KEY_PIN_CODE_HASH = "key_pin_code_hash"
    private static let KEY_PIN_CODE_BIOMETRICS = "key_pin_code_biometrics"
    
    static let DEFAULT_PIN = "887116"
    
    init(keyChain: Keychain = Keychain().synchronizable(false)) {
        self.keychain = keyChain
    }

    func clear() throws {
        try remove()
        try removeForBiometrics()
    }
    
    func save(_ pin: String) throws{
        let encrypted = try pin.encryptWithPBKDF2()
        try keychain.set(encrypted, key: PinPreference.KEY_PIN_CODE_HASH)
    }
    
    func remove() throws {
        try keychain.remove(PinPreference.KEY_PIN_CODE_HASH)
    }
    
    func verify(_ pin: String) -> Bool{
        guard let encrypted = try? keychain.get(PinPreference.KEY_PIN_CODE_HASH) else {
            return false
        }

        return encrypted?.verifyWithPBKDF2(pin) ?? false
    }
    
    var saved: Bool {
        return (try? keychain.contains(PinPreference.KEY_PIN_CODE_HASH)) ?? false
    }

    
    func saveForBiometrics(_ pin: String, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else {
                onError(NSError(domain: "No instance.", code: 0, userInfo: nil))
                return
            }
            do {
                try weakSelf.keychain
                    .accessibility(.whenPasscodeSetThisDeviceOnly, authenticationPolicy: .touchIDCurrentSet)
                    .set(pin, key: PinPreference.KEY_PIN_CODE_BIOMETRICS)
                
                onSuccess()
            } catch let error {
                onError(error)
            }
        }
    }
    
    func getForBiometrics(onSuccess: @escaping (String) -> Void, onError: @escaping (Error) -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let weakSelf = self else {
                onError(NSError(domain: "No instance.", code: 0, userInfo: nil))
                return
            }
            do {
                if let password = try weakSelf.keychain
                    .authenticationPrompt("Authenticate to login")
                    .get(PinPreference.KEY_PIN_CODE_BIOMETRICS) {
                    onSuccess(password)
                } else {
                    onError(NSError(domain: "No saved key.", code: 0, userInfo: nil))
                }
            } catch let error {
                onError(error)
            }
        }
    }
    
    func removeForBiometrics() throws{
        try keychain.remove(PinPreference.KEY_PIN_CODE_BIOMETRICS)
    }
    
    var savedForBiometrics: Bool {
        return (try? keychain.contains(PinPreference.KEY_PIN_CODE_BIOMETRICS)) ?? false
    }
}
