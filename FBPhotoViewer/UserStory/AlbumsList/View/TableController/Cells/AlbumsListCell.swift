//
//  AlbumCell.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Kingfisher
import UIKit

final class AlbumsListCell: UITableViewCell {
    
    private let albumImage = UIImageView()
    private let albumTitle = UILabel()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func update(with model: AlbumsListCellViewModel) {
        if let url = URL(string: model.album.picture.data.url) {
            albumImage.kf.setImage(with: url, placeholder: R.image.placeholder())
        }
        albumTitle.text = model.album.name
    }
    
    // MARK: - Private
    private func setupLayout() {
        
        contentView.backgroundColor = UIColor.white
        
        contentView.addSubview(albumImage)
        albumImage.image = R.image.placeholder()
        
        albumImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            albumImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            albumImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            albumImage.widthAnchor.constraint(equalToConstant: 150),
            albumImage.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        contentView.addSubview(albumTitle)
        
        albumTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            albumTitle.centerYAnchor.constraint(equalTo: albumImage.centerYAnchor),
            albumTitle.leadingAnchor.constraint(equalTo: albumImage.trailingAnchor, constant: 15),
            albumTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15)
        ])
    }
}
