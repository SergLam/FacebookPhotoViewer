//
//  FBAlbumPhotos.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBAlbumPhotos: Codable {
    
    var data: [FBAlbumPhotoData]
    var paging: FBAlbumPhotosPaging

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case paging = "paging"
    }
}
