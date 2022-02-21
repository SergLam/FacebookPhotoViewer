//
//  AlbumVC.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import AlisterSwift
import UIKit

final class AlbumPhotosVC: BaseViewController {
    
    private let contentView = AlbumPhotosView()
    private let controller: AlbumPhotosCollectionController
    private let viewModel: AlbumPhotosViewModel
    
    // MARK: - Life cycle
    init(album: FBPhotoAlbumJSON) {
        viewModel = AlbumPhotosViewModel(album: album)
        controller = AlbumPhotosCollectionController(collectionView: contentView.collectionView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        navigationItem.title = viewModel.album.name
        navigationItem.backBarButtonItem = UIBarButtonItem(title: Localizable.back(), style: .plain, target: nil, action: nil)
        super.viewDidLoad()
        configureAlister()
        showAlbumPhotos()
    }
    
    private func configureAlister() {
        controller.configureCells {
            $0.register(cell: AlbumPhotoCell.self, for: AlbumPhotoCellViewModel.self)
        }
        controller.selection = { [unowned self] model, _ in
            guard let model = model as? AlbumPhotoCellViewModel else { return }
            let vc = ViewPhotoVC(url: model.photo.photoUrl)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func showAlbumPhotos() {
        let viewModels = viewModel.album.photos.map { AlbumPhotoCellViewModel(photo: $0) }
        controller.storage.update {
            $0.add(viewModels)
        }
    }
    
}
