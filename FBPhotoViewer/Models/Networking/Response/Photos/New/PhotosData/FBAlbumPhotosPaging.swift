//
//  FBAlbumPhotosPaging.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBAlbumPhotosPaging: Codable {
    
    var cursors: FBPaginationCursor
    var next: String?

    enum CodingKeys: String, CodingKey {
        case cursors = "cursors"
        case next = "next"
    }
}
