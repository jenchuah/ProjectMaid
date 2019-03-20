//
//  KeychainService.swift
//  ShopifyMobileApp
//
//  Created by Jen Min Chuah on 30/6/18.
//  Copyright © 2018 Jenuine Apps. All rights reserved.
//

import Foundation

let kSecClassValue = NSString(format: kSecClass)
let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
let kSecValueDataValue = NSString(format: kSecValueData)
let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
let kSecAttrServiceValue = NSString(format: kSecAttrService)
let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
let kSecReturnDataValue = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)

public class KeychainService: NSObject {
    
    class func setPassword(service: String, account:String, data: String) throws {
        if let dataFromString: Data = data.data(using: String.Encoding.utf8, allowLossyConversion: false) {
            
            var query: [String: Any] = [:]
            query[String(kSecClass)] = kSecClassGenericPassword
            query[String(kSecAttrService)] = service
            query[String(kSecAttrAccount)] = account
            
            var status = SecItemCopyMatching(query as CFDictionary, nil)
            switch status {
            case errSecSuccess:
                var attributesToUpdate: [String: Any] = [:]
                attributesToUpdate[String(kSecValueData)] = dataFromString
                
                status = SecItemUpdate(query as CFDictionary,
                                       attributesToUpdate as CFDictionary)
                if status != errSecSuccess {
                    throw error(from: status)
                }
            case errSecItemNotFound:
                query[String(kSecValueData)] = dataFromString
                
                status = SecItemAdd(query as CFDictionary, nil)
                if status != errSecSuccess {
                    throw error(from: status)
                }
            default:
                throw error(from: status)
            }
        }
    }
    
    
    class func removePassword(service: String, account: String) throws {
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassGenericPassword
        query[String(kSecAttrService)] = service
        query[String(kSecAttrAccount)] = account
        
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw error(from: status)
        }
    }
    
    class func loadPassword(service: String, account: String) -> String? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassGenericPassword
        query[String(kSecAttrService)] = service
        query[String(kSecAttrAccount)] = account
        query[String(kSecReturnData)] = kCFBooleanTrue
//        query[String(kSecReturnAttributes)] = kCFBooleanTrue
        query[String(kSecMatchLimit)] = kSecMatchLimitOne
        
        var dataTypeRef :AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        var contentsOfKeychain: String?
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = String(data: retrievedData, encoding: String.Encoding.utf8)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }

    private class func error(from status: OSStatus) -> SecureStoreError {
        let message = SecCopyErrorMessageString(status, nil) as String? ?? NSLocalizedString("Unhandled Error", comment: "")
        return SecureStoreError.unhandledError(message: message)
    }
}
