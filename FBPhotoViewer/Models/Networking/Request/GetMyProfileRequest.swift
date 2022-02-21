//
//  GetMyProfileRequest.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/20/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct GetMyProfileRequest {
    let path = "me"
    let parameters: [String: Any] = ["fields": "id, first_name, last_name, name"]
}
