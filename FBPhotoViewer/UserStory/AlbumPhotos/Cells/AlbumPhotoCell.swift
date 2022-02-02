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
