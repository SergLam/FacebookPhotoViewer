//
//  FBPhotoAlbum.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBPhotoAlbum: Codable {
    
    var id: String
    var coverPhoto: FBAlbumCoverPhoto
    var name: String
    var photoCount: Int
    var photos: FBAlbumPhotos
    var picture: FBAlbumPicture

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case coverPhoto = "cover_photo"
        case name = "name"
        case photoCount = "photo_count"
        case photos = "photos"
        case picture = "picture"
    }
}
