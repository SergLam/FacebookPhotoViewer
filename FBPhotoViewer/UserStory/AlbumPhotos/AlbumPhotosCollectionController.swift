//
//  AlbumPhotosCollectionController.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol AlbumPhotosCollectionControllerDelegate: AnyObject {
    
    func didSelectCell(_ model: AlbumPhotoCellViewModel)
    func didFinishDataSourceUpdates()
}

final class AlbumPhotosCollectionController: NSObject {
    
    weak var delegate: AlbumPhotosCollectionControllerDelegate?
    
    private let itemsSpacing: CGFloat = 0.5
    
    private var models: [AlbumPhotoCellViewModel] = []
    
    private let collectionView: UICollectionView
    private let collectionViewUpdatesQueue: DispatchQueue = DispatchQueue(label: "\(AlbumPhotosCollectionController.self).list.diffs", qos: .userInteractive, attributes: [], autoreleaseFrequency: .workItem, target: nil)
    
    // MARK: - Life cycle
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        collectionView.registerCellClass(AlbumPhotoCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Public
    func update(with models: [AlbumPhotoCellViewModel]) {
        collectionViewUpdatesQueue.async { [weak self] in
            self?.models = models
            self?.delegate?.didFinishDataSourceUpdates()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension AlbumPhotosCollectionController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(AlbumPhotoCell.self, for: indexPath)
        cell.update(with: models[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AlbumPhotosCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width / 3) - itemsSpacing * 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return itemsSpacing * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemsSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}

// MARK: - UICollectionViewDelegate
extension AlbumPhotosCollectionController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        delegate?.didSelectCell(model)
    }
}
