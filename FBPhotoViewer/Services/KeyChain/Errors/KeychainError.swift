//
//  KeychainError.swift
//  Facebook-iOS
//
//  Created by Serg Liamtsev on 2/11/22.
//

import Foundation
 
enum KeychainError: Error, LocalizedError {
    
    // Attempted read for an item that does not exist.
    case itemNotFound(KeyChainItem)
            
    // Attempted save to override an existing item.
    // Use update instead of save to update existing items
    case duplicateItem(KeyChainItem)
            
    // A read of an item in any format other than Data
    case invalidItemFormat
            
    // Any operation result status than errSecSuccess
    case unexpectedStatus(OSStatus)
    
    var description: String {
        switch self {
        case .itemNotFound(let item):
            return "KeyChain - Attempted read for an item that does not exist - service: \(item.service) account: \(item.account)"
        case .duplicateItem(let item):
            let errorPrefix = "KeyChain - Attempted save to override an existing item."
            let errorSuffix = "Use update instead of save to update existing items. service: \(item.service) account: \(item.account)"
            return "\(errorPrefix) \(errorSuffix)"
        case .invalidItemFormat:
            return "KeyChain - A read of an item in any format other than Data"
        case .unexpectedStatus(let status):
            return "KeyChain - error code \(status.description)"
        }
    }
    
    var failureReason: String? {
        return self.description
    }
    
    var errorDescription: String? {
        return self.description
    }
}
