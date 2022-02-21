//
//  GetMyPhotoAlbumsResponseData.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct GetMyPhotoAlbumsResponseData: Codable {
    
    var coverPhoto: FBAlbumCoverPhoto
    var id: String
    var name: String
    var photoCount: Int
    var photos: FBAlbumPhotos
    var picture: FBAlbumPicture

    enum CodingKeys: String, CodingKey {
        case coverPhoto = "cover_photo"
        case id = "id"
        case name = "name"
        case photoCount = "photo_count"
        case photos = "photos"
        case picture = "picture"
    }
}
