//
//  FBAlbumPicture.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBAlbumPicture: Codable {
    
    var data: FBAlbumPictureData

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
