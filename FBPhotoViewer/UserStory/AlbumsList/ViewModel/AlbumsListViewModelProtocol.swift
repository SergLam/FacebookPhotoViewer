//
//  AlbumsListViewModelProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/5/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol AlbumsListViewModelDelegate: AnyObject {
    
    func didReceiveError(_ error: Error)
    func onLoadAlbumsSuccess()
}

protocol AlbumsListViewModelProtocol: AnyObject {
    
    var delegate: AlbumsListViewModelDelegate? { get set }
    
    var albums: [FBPhotoAlbum] { get set }
    
    func loadUserAlbums()
}
