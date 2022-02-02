//
//  FBApiManager.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/13/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import FBSDKCoreKit
import Foundation
import SwiftyJSON

final class FBApiManager {
    
    static let shared = FBApiManager()
    
    struct MyProfileRequest {
        let path = "me"
        let parameters: [String: Any] = ["fields": "id, first_name, last_name, name"]
    }
    
    struct UserAlbumsRequest {
        // TODO: Add pagination
        let path = "me/albums"
        let parameters: [String: Any] = ["fields":
            "id, photo_count, name, photos{picture, id, images}, cover_photo, picture"]
    }
    
    func getUserProfile(completion: @escaping (User?, Error?) -> Void) {
        let request = MyProfileRequest()
        let graphRequest = GraphRequest(graphPath: request.path, parameters: request.parameters)
        graphRequest.start(completion: { _, result, error in
            if let result = result {
                let user = User(json: JSON(result))
                completion(user, error)
            } else {
                completion(nil, error)
            }
        })
    }
    
    func getUserAlbums(completion: @escaping ([Album]?, Error?) -> Void) {
        let request = UserAlbumsRequest()
        let graphRequest = GraphRequest(graphPath: request.path, parameters: request.parameters)
        graphRequest.start(completion: { _, result, error in
            if let result = result {
                let json = JSON(result)
                let albums_data = json["data"].arrayValue
                var albums: [Album] = []
                for data in albums_data {
                    albums.append(Album(json: data))
                }
                completion(albums, error)
            } else {
                completion(nil, error)
            }
        })
    }
    
}
