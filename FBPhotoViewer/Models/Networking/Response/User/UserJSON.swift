//
//  UserJSON.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/14/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

struct UserJSON: Codable {
    
    var id: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var name: String = ""
    
    var fullName: String? {
        guard !firstName.isEmpty, !lastName.isEmpty else { return nil }
        return firstName + " " + lastName
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeForce(String.self, forKey: .id)
        firstName = try container.decodeIfPresentForce(String.self, forKey: .firstName) ?? ""
        lastName = try container.decodeIfPresentForce(String.self, forKey: .lastName) ?? ""
        name = try container.decodeIfPresentForce(String.self, forKey: .name) ?? ""
    }
}

// TEST USER:
// qqcjdtzyuy_1552376613@tfbnw.net
// password123456
