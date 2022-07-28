//
//  KeyChainService.swift
//  Facebook-iOS
//
//  Created by Serg Liamtsev on 2/11/22.
//

import Foundation

protocol KeyChainServiceProtocol {
    func read(item: KeyChainItem) throws -> Data?
    func write(item: KeyChainItem, data: Data) throws
    func delete(item: KeyChainItem) throws
}

final class KeyChainService: KeyChainServiceProtocol {
    
    func read(item: KeyChainItem) throws -> Data? {
        let query: [String: AnyObject] = [
            // kSecAttrService,  kSecAttrAccount, and kSecClass
            // uniquely identify the item to read in Keychain
            kSecAttrService as String: item.service as AnyObject,
            kSecAttrAccount as String: item.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            
            // kSecMatchLimitOne indicates keychain should read
            // only the most recent item matching this query
            kSecMatchLimit as String: kSecMatchLimitOne,
            
            // kSecReturnData is set to kCFBooleanTrue in order
            // to retrieve the data for the item
            kSecReturnData as String: kCFBooleanTrue
        ]
        
        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)
        
        // errSecItemNotFound is a special status indicating the
        // read item does not exist. Throw itemNotFound so the
        // client can determine whether or not to handle
        // this case
        guard status != errSecItemNotFound else {
            throw KeychainError.itemNotFound(item)
        }
        
        // Any status other than errSecSuccess indicates the
        // read operation failed.
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
        
        // This implementation of KeychainInterface requires all
        // items to be saved and read as Data. Otherwise,
        // invalidItemFormat is thrown
        guard let data = itemCopy as? Data else {
            throw KeychainError.invalidItemFormat
        }
        
        return data
    }
    
    func delete(item: KeyChainItem) throws {
        let query: [String: AnyObject] = [
            // kSecAttrService,  kSecAttrAccount, and kSecClass
            // uniquely identify the item to delete in Keychain
            kSecAttrService as String: item.service as AnyObject,
            kSecAttrAccount as String: item.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword
        ]
        let status = SecItemDelete(query as CFDictionary)
        
        // Any status other than errSecSuccess indicates the
        // delete operation failed.
        guard status == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
    
    func write(item: KeyChainItem, data: Data) throws {
        
        let query: [String: AnyObject] = [
            kSecAttrService as String: item.service as AnyObject,
            kSecAttrAccount as String: item.account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: data as AnyObject
        ]
        var itemRef: CFTypeRef?
        let status = SecItemAdd(query as CFDictionary, &itemRef)
        
        // Item is already present in KeyChain, need to be updated
        guard status == errSecDuplicateItem else {
            
            guard status != errSecItemNotFound else {
                throw KeychainError.itemNotFound(item)
            }
            guard status == errSecSuccess else {
                throw KeychainError.unexpectedStatus(status)
            }
            return
        }
        
        // attributes is passed to SecItemUpdate with
        // kSecValueData as the updated item value
        let attributes: [String: AnyObject] = [
            kSecValueData as String: data as AnyObject
        ]
        
        // SecItemUpdate attempts to update the item identified
        // by query, overriding the previous value
        let updateStatus = SecItemUpdate(
            query as CFDictionary,
            attributes as CFDictionary
        )
        
        // errSecItemNotFound is a special status indicating the
        // item to update does not exist. Throw itemNotFound so
        // the client can determine whether or not to handle
        // this as an error
        guard updateStatus != errSecItemNotFound else {
            throw KeychainError.itemNotFound(item)
        }
        
        // Any status other than errSecSuccess indicates the
        // update operation failed.
        guard updateStatus == errSecSuccess else {
            throw KeychainError.unexpectedStatus(status)
        }
    }
}
