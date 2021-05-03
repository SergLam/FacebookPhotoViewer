//
//  FBAlbum.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Album {
    
    static func fromJSON(_ data: [String: Any]) -> Album {
        let json = JSON(data)
        return Album(json: json)
    }
    
    var id: String = ""
    var photoCount: Int = 0
    var name: String = ""
    var photos: [Photo] = []
    var coverPhotoUrl: String = ""
    
    init(json: JSON) {
        id = json["id"].stringValue
        photoCount = json["photo_count"].intValue
        name = json["name"].stringValue
        photos = json["photos"]["data"].arrayValue.map { return Photo(json: $0) }
        coverPhotoUrl = json["picture"]["data"]["url"].stringValue
    }
    
    init(data: [String: Any]) {
        let json = JSON(data)
        self.init(json: json)
    }
    
    func toJSON() -> [String: Any] {
        var result: [String: Any] = [:]
        result["id"] = id
        result["photo_count"] = photoCount
        result["name"] = name
        result["photos"] = Photo.photosToJSON(photos)
        
        return result
    }
    
}
