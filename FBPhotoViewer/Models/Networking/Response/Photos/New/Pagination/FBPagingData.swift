//
//  FBPagingData.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBPagingData: Codable {
    
    var cursors: FBPaginationCursor

    enum CodingKeys: String, CodingKey {
        case cursors = "cursors"
    }
}
