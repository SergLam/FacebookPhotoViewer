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
    }
    
    struct UserAlbumsRequest {
        let path = "me/albums"
        let parameters: [String : Any] = ["fields": "id, photo_count, name, photos{picture,id}, cover_photo"]
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
    
    func getUserAlbums(completion: @escaping (String?, Error?) -> ()) {
        let request = UserAlbumsRequest()
        FBSDKGraphRequest(graphPath: request.path, parameters: request.parameters)?.start(completionHandler: { (connection, result, error) in
            if let result = result {
                completion(String(describing: result), error)
            } else {
                completion(nil, error)
            }
        })
    }
    
}
