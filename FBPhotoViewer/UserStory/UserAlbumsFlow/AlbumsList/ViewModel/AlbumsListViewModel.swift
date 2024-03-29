//
//  AlbumsViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

final class AlbumsListViewModel: AlbumsListViewModelProtocol {
    
    weak var coordinator: UserAlbumsCoordinatorProtocol?
    
    weak var delegate: AlbumsListViewModelDelegate?
    
    var albums: [FBPhotoAlbum] = []
    
    private let fbApiManager = FBGraphAPIManager()
    
    func loadUserAlbums() {
        fbApiManager.getUserAlbums(completion: { [weak self] result in
            switch result {
            case .success(let response):
                self?.albums = response.data
                self?.delegate?.onLoadAlbumsSuccess()
            case .failure(let error):
                self?.delegate?.didReceiveError(error)
            }
        })
    }
    
}
