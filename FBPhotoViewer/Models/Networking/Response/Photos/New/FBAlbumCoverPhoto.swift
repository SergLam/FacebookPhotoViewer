//
//  FBAlbumCoverPhoto.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBAlbumCoverPhoto: Codable {
    
    var createdTime: Date
    var id: String
    var name: String?

    enum CodingKeys: String, CodingKey {
        case createdTime = "created_time"
        case id = "id"
        case name = "name"
    }
}
