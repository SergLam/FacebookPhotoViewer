//
//  ViewPhotoViewModelProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol ViewPhotoViewModelProtocol {
    
    var coordinator: UserAlbumsCoordinatorProtocol? { get set }
    
    var model: FBAlbumPhotoData { get set }
}
