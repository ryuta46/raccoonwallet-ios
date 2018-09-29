//
//  PinPreferenceTest.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/21.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation

import XCTest
import KeychainAccess
@testable import RaccoonWallet

class PinPreferenceTest: XCTestCase {
    
    var preference: PinPreference!
    override func setUp() {
        preference = PinPreference(keyChain: Keychain(service: Bundle.main.bundleIdentifier! + ".test"))
    }
    
    func testSave() {
        let pin = "283658"
        try! preference.save(pin)
        
     }
    
    func testVerify() {
        let pin = "283658"
        try! preference.save(pin)
        
        XCTAssertTrue(preference.verify(pin))
        XCTAssertFalse(preference.verify("000000"))
    }
    
    func testOverwrite() {
        let pin = "283658"
        try! preference.save(pin)
        
        XCTAssertTrue(preference.verify(pin))
        
        let nextPin = "578918"
        try! preference.save(nextPin)
        
        XCTAssertFalse(preference.verify(pin))
        XCTAssertTrue(preference.verify(nextPin))
    }
    
    func testRemove() {
        let pin = "283658"
        try! preference.save(pin)

        XCTAssertTrue(preference.saved)
        XCTAssertTrue(preference.verify(pin))

        try! preference.remove()
        
        XCTAssertFalse(preference.saved)
        XCTAssertFalse(preference.verify(pin))
    }

    func syncSaveForFingerPrint(pin: String) {
        let semaphore = DispatchSemaphore(value: 0)
        var success = false
        preference.saveForBiometrics(
            pin,
            onSuccess: {
                success = true
                semaphore.signal() },
            onError: { error in
                success = false
                print(error.localizedDescription)
                semaphore.signal() })
        
        semaphore.wait()
        XCTAssertTrue(success)
    }
    
    func syncGetForFingerPrint() -> String?{
        let semaphor = DispatchSemaphore(value: 0)
        var result: String? = nil
        preference.getForBiometrics(
            onSuccess: { pin in
                result = pin
                semaphor.signal() },
            onError: { error in
                print(error.localizedDescription)
                semaphor.signal() })
        
        semaphor.wait()
        return result
    }


    func testSaveForFingerPrint() {
        let pin = "283658"
        syncSaveForFingerPrint(pin: pin)
        
        XCTAssertTrue(preference.savedForBiometrics)
    }
    func testRemoveForFingerPrint() {
        let pin = "283658"
        syncSaveForFingerPrint(pin: pin)

        try! preference.removeForBiometrics()

        XCTAssertNil(syncGetForFingerPrint())
    }

     
    func testGetForFingerPrint() {
        try! preference.removeForBiometrics()

        let pin = "283658"
     
        syncSaveForFingerPrint(pin: pin)
        
        let result = syncGetForFingerPrint()
     
        XCTAssertNotNil(result)
        XCTAssertEqual(pin, result)
    }
}
