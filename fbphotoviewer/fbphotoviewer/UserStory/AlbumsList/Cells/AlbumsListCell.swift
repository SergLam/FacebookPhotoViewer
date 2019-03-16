//
//  AlbumCell.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import AlisterSwift
import Kingfisher

class AlbumsListCellViewModel: ViewModelInterface {
    let album: Album
    
    init(album: Album) {
        self.album = album
    }
}

class AlbumsListCell: UITableViewCell, ReusableViewInterface {
    
    let albumImage = UIImageView()
    let albumTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        contentView.addSubview(albumImage)
        albumImage.snp.makeConstraints { (make) in
            make.top.bottom.leading.equalToSuperview()
                .inset(UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 0))
            make.size.equalTo(150)
        }
        
        contentView.addSubview(albumTitle)
        albumTitle.snp.makeConstraints { (make) in
            make.centerY.equalTo(albumImage)
            make.leading.equalTo(albumImage.snp.trailing).offset(15)
            make.trailing.equalToSuperview().offset(-15)
        }
    }
    
    func update(_ model: ViewModelInterface) {
        guard let model = model as? AlbumsListCellViewModel else { return }
        if let url = URL(string: model.album.coverPhotoUrl) {
            albumImage.kf.setImage(with: url)
        }
        albumTitle.text = model.album.name
    }
    
}
