//
//  KeyChainItemsHolder.swift
//  Facebook-iOS
//
//  Created by Serg Liamtsev on 2/11/22.
//

import Foundation

struct KeyChainItem {
    
    // kSecAttrService
    var service: String
    // kSecAttrAccount
    var account: String
    
    fileprivate init(service: String, account: String) {
        self.service = service
        self.account = account
    }
}

struct KeyChainItemsHolder {
    
    static let facebookToken: KeyChainItem = KeyChainItem(service: "facebook", account: "my_account_token")
    
    static let facebookTokenExpDate: KeyChainItem = KeyChainItem(service: "facebook", account: "my_account_token_exp_date")
}
