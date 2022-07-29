//
//  UserAlbumsCoordinatorProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol UserAlbumsCoordinatorProtocol: Coordinator {
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer)
    
    func openAlbumDetails(model: FBPhotoAlbum)
    
    func openPhotoDetails(model: FBAlbumPhotoData)
    
    func logOut()
}
