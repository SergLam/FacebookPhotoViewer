//
//  FBUser.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/14/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    
    static func fromJSON(_ data: [String: Any]) -> User {
        let json = JSON(data)
        return User(json: json)
    }
    
    var firstName: String = ""
    var lastName: String = ""
    var name: String = ""
    
    var fullName: String? {
        guard !firstName.isEmpty, !lastName.isEmpty else { return nil }
        return firstName + " " + lastName
    }
    
    init(json: JSON) {
        firstName = json["first_name"].stringValue
        lastName = json["last_name"].stringValue
        name = json["name"].stringValue
    }
    
    init(data: [String : Any]) {
        let json = JSON(data)
        self.init(json: json)
    }
    
    func toJSON() -> [String: Any] {
        var result: [String: Any] = [:]
        result["first_name"] = firstName
        result["last_name"] = lastName
        result["name"] = name
        
        return result
    }
    
}
