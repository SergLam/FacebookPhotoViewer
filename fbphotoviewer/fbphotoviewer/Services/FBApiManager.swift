//
//  FBApiManager.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/13/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import FacebookCore
import FBSDKCoreKit
import SwiftyJSON


class FBApiManager {
    
    static let shared = FBApiManager()
    
    struct MyProfileRequest {
        let path = "me"
        let parameters: [String : Any] = ["fields": "id, first_name, last_name, name"]
        let token = AccessToken.current?.authenticationToken
        let method: GraphRequestHTTPMethod = .GET
        let apiVersion = GraphAPIVersion.defaultVersion.stringValue
    }
    
    func getUserProfile(completion: @escaping (User?, Error?) -> ()) {
        let request = MyProfileRequest()
        FBSDKGraphRequest(graphPath: request.path, parameters: request.parameters)?.start(completionHandler: { (connection, result, error) in
            if let result = result {
                let user = User(json: JSON(result))
                completion(user, error)
            } else {
                completion(nil, error)
            }
        })
    }
    
}
