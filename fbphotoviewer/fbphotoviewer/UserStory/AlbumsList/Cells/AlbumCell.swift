//
//  AlbumCell.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import AlisterSwift

class AlbumCellViewModel: ViewModelInterface {
    let album: Album
    
    init(album: Album) {
        self.album = album
    }
}

class AlbumCell: UITableViewCell, ReusableViewInterface {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(_ model: ViewModelInterface) {
        guard let model = model as? AlbumCellViewModel else { return }
//        imageView?.setImage(searchIcon)
//        textLabel?.text = model.locationTitle
    }
    
}
