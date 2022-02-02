//
//  AlbumViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

final class AlbumPhotosViewModel {
    
    var album: Album
    
    // MARK: - Life cycle
    init(album: Album) {
        self.album = album
    }
    
}
