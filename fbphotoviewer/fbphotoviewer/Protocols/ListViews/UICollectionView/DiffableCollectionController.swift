//
//  DiffableCollectionController.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
protocol DiffableCollectionController: NSObject, UICollectionViewDelegate & UICollectionViewDelegateFlowLayout {
    
    // NOTE: Protocol 'DiffableCollectionController' can only be used as a generic constraint because it has Self or associated type requirements
    associatedtype DataSource = UICollectionViewDiffableDataSource<AnyHashable, AnyHashable>
    associatedtype Snapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>
    
    var dataSource: DataSource { get set }
    
    var sections: [CollectionSectionVM] { get set }
    
    var factory: CollectionCellsFactory { get set }
    
    var collectionView: UICollectionView { get set }
    
    init(collectionView: UICollectionView)
    
    func makeDataSource() -> DataSource
    
    func updateDataSource(with newItems: [CollectionCellModel], animated: Bool)
    
}
