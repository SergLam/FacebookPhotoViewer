//
//  Photo.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Photo {
    
    static func fromJSON(_ data: [String: Any]) -> Photo {
        let json = JSON(data)
        return Photo(json: json)
    }
    
    var id: String = ""
    var picture: String = ""
    
    init(json: JSON) {
        id = json["id"].stringValue
        picture = json["picture"].stringValue
    }
    
    init(data: [String : Any]) {
        let json = JSON(data)
        self.init(json: json)
    }
    
    func toJSON() -> [String: Any] {
        var result: [String: Any] = [:]
        result["id"] = id
        result["picture"] = picture
        return result
    }
    
}

extension Photo {
    
    static func photosToJSON(_ photos: [Photo]) -> [String: Any] {
        var photosArray = [String : Any]()
        photos.forEach {
            photosArray.merge($0.toJSON()) {(old, new) in old }
        }
        return photosArray
    }
}
