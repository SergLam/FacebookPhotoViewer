//
//  AlbumViewModel.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

final class AlbumPhotosViewModel {
    
    var album: Album
    
    // MARK: - Life cycle
    init(album: Album) {
        self.album = album
    }
    
}
