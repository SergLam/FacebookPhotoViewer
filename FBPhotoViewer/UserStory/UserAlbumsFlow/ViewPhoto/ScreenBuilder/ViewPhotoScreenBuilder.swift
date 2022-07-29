//
//  ViewPhotoScreenBuilder.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/29/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

final class ViewPhotoScreenBuilder {
    
    class func makeModule(with model: FBAlbumPhotoData, coordinator: UserAlbumsCoordinatorProtocol) -> ViewPhotoViewControllerProtocol {
        
        var viewModel: ViewPhotoViewModelProtocol = ViewPhotoViewModel(model: model)
        viewModel.coordinator = coordinator
        let viewController: ViewPhotoViewControllerProtocol = ViewPhotoViewController(viewModel: viewModel)
        return viewController
    }
}
