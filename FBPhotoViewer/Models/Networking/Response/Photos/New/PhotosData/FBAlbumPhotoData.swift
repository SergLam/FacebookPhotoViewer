//
//  FBAlbumPhotoData.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBAlbumPhotoData: Codable {
    
    var id: String
    var images: [FBAlbumImage]
    var picture: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case images = "images"
        case picture = "picture"
    }
}
