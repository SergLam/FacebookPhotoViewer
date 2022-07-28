//
//  AlbumViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

final class AlbumPhotosViewModel: AlbumPhotosViewModelProtocol {
    
    var album: FBPhotoAlbum
    
    // MARK: - Life cycle
    init(album: FBPhotoAlbum) {
        self.album = album
    }
}
