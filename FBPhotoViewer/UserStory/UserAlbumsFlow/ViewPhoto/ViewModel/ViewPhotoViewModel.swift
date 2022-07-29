//
//  ViewPhotoViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

final class ViewPhotoViewModel: ViewPhotoViewModelProtocol {
    
    weak var coordinator: UserAlbumsCoordinatorProtocol?
    
    var model: FBAlbumPhotoData
    
    // MARK: - Life cycle
    init(model: FBAlbumPhotoData) {
        self.model = model
    }
}
