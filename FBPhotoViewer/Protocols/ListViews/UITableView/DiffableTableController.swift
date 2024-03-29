//
//  DiffableTableController.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
protocol DiffableTableController: NSObject, UITableViewDelegate {
    
    // NOTE: Protocol 'DiffableTableController' can only be used as a generic constraint because it has Self or associated type requirements
    associatedtype DataSource = UITableViewDiffableDataSource<AnyHashable, AnyHashable>
    associatedtype Snapshot = NSDiffableDataSourceSnapshot<AnyHashable, AnyHashable>
    
    var dataSource: DataSource { get set }
    
    var sections: [TableViewSectionVM] { get set }
    
    var factory: TableCellsFactory { get set }
    
    var tableView: UITableView { get set }
    
    init(tableView: UITableView)
    
    func makeDataSource() -> DataSource
    
    func updateDataSource(with newItems: [TableCellModel], animated: Bool)
    
}
