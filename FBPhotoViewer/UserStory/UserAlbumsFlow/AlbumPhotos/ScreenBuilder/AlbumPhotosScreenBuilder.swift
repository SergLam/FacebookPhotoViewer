//
//  AlbumPhotosScreenBuilder.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

final class AlbumPhotosScreenBuilder {
    
    class func makeModule(with model: FBPhotoAlbum, coordinator: UserAlbumsCoordinatorProtocol) -> AlbumPhotosViewControllerProtocol {
        
        let viewModel: AlbumPhotosViewModel = AlbumPhotosViewModel(album: model)
        viewModel.coordinator = coordinator
        let viewController: AlbumPhotosViewController = AlbumPhotosViewController(viewModel: viewModel)
        return viewController
    }
}
