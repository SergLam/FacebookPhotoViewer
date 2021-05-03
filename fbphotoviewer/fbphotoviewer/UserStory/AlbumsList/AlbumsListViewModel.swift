//
//  AlbumsViewModel.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

protocol AlbumsListViewModelDelegate: AnyObject {
    func didFailToLoadData(_ error: String)
    func onLoadAlbumsSuccess()
}

class AlbumsListViewModel {
    
    weak var delegate: AlbumsListViewModelDelegate?
    
    var albums: [Album] = []
    
    func loadUserAlbums() {
        FBApiManager.shared.getUserAlbums(completion: {  [weak self] (albums, error) in
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
