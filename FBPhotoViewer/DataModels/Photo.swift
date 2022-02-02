//
//  Photo.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Photo {
    
    static func fromJSON(_ data: [String: Any]) -> Photo {
        let json = JSON(data)
        return Photo(json: json)
    }
    
    var id: String = ""
    var thumbnailUrl: String = ""
    var photoUrl: String = ""
    
    init(json: JSON) {
        id = json["id"].stringValue
        thumbnailUrl = json["picture"].stringValue
        photoUrl = json["images"].arrayValue[0]["source"].stringValue
    }
    
    init(data: [String: Any]) {
        let json = JSON(data)
        self.init(json: json)
    }
    
    func toJSON() -> [String: Any] {
        var result: [String: Any] = [:]
        result["id"] = id
        result["picture"] = thumbnailUrl
        result["images"] = ["source": photoUrl]
        return result
    }
    
}

extension Photo {
    
    static func photosToJSON(_ photos: [Photo]) -> [String: Any] {
        var photosArray = [String: Any]()
        photos.forEach {
            photosArray.merge($0.toJSON()) { old, _ in
                old
            }
        }
        return photosArray
    }
}
