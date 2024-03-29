//
//  AlbumView.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

final class AlbumPhotosView: UIView {
    
    private(set) var collectionView: UICollectionView
    private let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    // MARK: - Life cycle
    init() {
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(frame: CGRect.zero)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    private func setupLayout() {
        
        backgroundColor = UIColor.white
        
        layout.scrollDirection = .vertical
        addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
