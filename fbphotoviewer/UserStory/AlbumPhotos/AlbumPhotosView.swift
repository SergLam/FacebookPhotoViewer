//
//  AlbumView.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import SnapKit
import UIKit

final class AlbumPhotosView: UIView {
    
    let collectionView: UICollectionView
    let layout = UICollectionViewFlowLayout()
    
    init() {
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        super.init(frame: CGRect.zero)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        layout.scrollDirection = .vertical
        
        addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
