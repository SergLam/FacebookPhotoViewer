//
//  AlbumPhotoCell.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import AlisterSwift
import Kingfisher
import UIKit

final class AlbumPhotoCellViewModel: ViewModelInterface {
    
    let photo: FBAlbumPhotoData
    
    init(photo: FBAlbumPhotoData) {
        self.photo = photo
    }
}

final class AlbumPhotoCell: UICollectionViewCell, ReusableViewInterface {
    
    let photoImageView = UIImageView()
    let placeholder = R.image.placeholder()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(photoImageView)
        photoImageView.image = placeholder
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func update(_ model: ViewModelInterface) {
        guard let model = model as? AlbumPhotoCellViewModel else { return }
        if let url = URL(string: model.photo.picture) {
            photoImageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
}
