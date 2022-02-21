//
//  FBPaginationCursor.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/21/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct FBPaginationCursor: Codable {
    
    var after: String
    var before: String

    enum CodingKeys: String, CodingKey {
        case after = "after"
        case before = "before"
    }
}
