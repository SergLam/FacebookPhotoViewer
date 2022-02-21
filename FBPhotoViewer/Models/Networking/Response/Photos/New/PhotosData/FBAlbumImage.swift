//
//  FBAlbumImage.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

// MARK: - Image
struct FBAlbumImage: Codable {
    
    var height: Int
    var width: Int
    var url: String

    enum CodingKeys: String, CodingKey {
        case height = "height"
        case width = "width"
        case url = "source"
    }
}
