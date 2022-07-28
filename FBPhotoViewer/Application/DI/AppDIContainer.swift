//
//  AppDIContainer.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 2/8/22.
//

import Foundation

struct AppDIContainer {
    
    var isUserAuthorized: Bool {
        let token = try? KeyChainService().read(item: KeyChainItemsHolder.facebookToken)
        return token != nil
    }
    
}
