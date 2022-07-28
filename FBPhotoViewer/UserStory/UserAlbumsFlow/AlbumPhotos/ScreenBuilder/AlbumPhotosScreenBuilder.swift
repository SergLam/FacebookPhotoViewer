//
//  AlbumPhotosScreenBuilder.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

final class AlbumPhotosScreenBuilder {
    
    class func makeModule(with model: Void, coordinator: UserAlbumsCoordinatorProtocol) -> AlbumsListViewControllerProtocol {
        
        let viewModel: AlbumsListViewModelProtocol = AlbumsListViewModel()
        viewModel.coordinator = coordinator
        let viewController: AlbumsListViewController = AlbumsListViewController(viewModel: viewModel)
        return viewController
    }
}
