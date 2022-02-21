//
//  GetMyPhotoAlbumsRequest.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/20/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

struct GetMyPhotoAlbumsRequest {
    let path = "me/albums"
    let parameters: [String: Any] = ["fields":
        "id, photo_count, name, photos{picture, id, images}, cover_photo, picture"]
}
