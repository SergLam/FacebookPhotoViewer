//
//  FBAlbumPictureData.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBAlbumPictureData: Codable {
    
    var isSilhouette: Bool
    var url: String

    enum CodingKeys: String, CodingKey {
        case isSilhouette = "is_silhouette"
        case url = "url"
    }
}
