//
//  AlbumPhotoCell.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import AlisterSwift
import Kingfisher

final class AlbumPhotoCellViewModel: ViewModelInterface {
    
    let photo: Photo
    
    init(photo: Photo) {
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
        photoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func update(_ model: ViewModelInterface) {
        guard let model = model as? AlbumPhotoCellViewModel else { return }
        if let url = URL(string: model.photo.thumbnailUrl) {
            photoImageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
}
