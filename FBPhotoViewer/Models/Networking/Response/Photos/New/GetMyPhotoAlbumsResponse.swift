//
//  GetMyPhotoAlbumsResponse.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/20/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct GetMyPhotoAlbumsResponse: Codable {
    
    var data: [FBPhotoAlbum]
    var paging: FBPagingData

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case paging = "paging"
    }
}
