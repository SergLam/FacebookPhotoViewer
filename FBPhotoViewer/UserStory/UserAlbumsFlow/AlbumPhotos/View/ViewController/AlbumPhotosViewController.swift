//
//  AlbumPhotosViewController.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

final class AlbumPhotosViewController: BaseViewController, AlbumPhotosViewControllerProtocol {
    
    private let contentView = AlbumPhotosView()
    private let collectionController: AlbumPhotosCollectionController
    private let viewModel: AlbumPhotosViewModelProtocol
    
    // MARK: - Life cycle
    init(viewModel: AlbumPhotosViewModelProtocol) {
        self.viewModel = viewModel
        collectionController = AlbumPhotosCollectionController(collectionView: contentView.collectionView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        collectionController.delegate = self
        showAlbumPhotos()
    }
    
    private func configureNavBar() {
        navigationItem.title = viewModel.album.name
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Localizable.back(), style: .plain, target: nil, action: nil)
    }
    
    private func showAlbumPhotos() {
        let viewModels = viewModel.album.photos.data.map { AlbumPhotoCellViewModel(photo: $0)
        }
        collectionController.update(with: viewModels)
    }
    
}

// MARK: - AlbumPhotosCollectionControllerDelegate
extension AlbumPhotosViewController: AlbumPhotosCollectionControllerDelegate {
    
    func didSelectCell(_ model: AlbumPhotoCellViewModel) {
        viewModel.coordinator?.openPhotoDetails(model: model.photo)
    }
    
    func didFinishDataSourceUpdates() {
        executeOnMain { [weak self] in
            self?.contentView.collectionView.reloadData()
        }
    }
}
