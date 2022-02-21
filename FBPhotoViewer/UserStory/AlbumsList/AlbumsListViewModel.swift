//
//  AlbumsViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol AlbumsListViewModelDelegate: AnyObject {
    func didFailToLoadData(_ error: String)
    func onLoadAlbumsSuccess()
}

final class AlbumsListViewModel {
    
    weak var delegate: AlbumsListViewModelDelegate?
    
    var albums: [FBPhotoAlbumJSON] = []
    
    private let fbApiManager = FBGraphAPIManager()
    
    func loadUserAlbums() {
        fbApiManager.getUserAlbums(completion: {  [weak self] albums, error in
            if let error = error {
                self?.delegate?.didFailToLoadData(error.localizedDescription)
            }
            if let albums = albums {
                self?.albums = albums
                self?.delegate?.onLoadAlbumsSuccess()
            }
        })
    }
    
}
