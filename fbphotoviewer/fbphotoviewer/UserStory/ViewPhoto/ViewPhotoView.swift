//
//  ViewPhotoView.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ViewPhotoView: UIView {
    
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
        backgroundColor = .white
        
        addSubview(photoImageView)
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func loadPhoto(withURL: String) {
        if let url = URL(string: withURL) {
            photoImageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
}
