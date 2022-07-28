//
//  ViewPhotoView.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Kingfisher
import UIKit

final class ViewPhotoView: UIView {
    
    private let photoImageView = UIImageView()
    private let placeholder = R.image.placeholder()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = UIColor.white
        
        addSubview(photoImageView)
        photoImageView.contentMode = .scaleAspectFit
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func loadPhoto(withURL: String) {
        if let url = URL(string: withURL) {
            photoImageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
}
