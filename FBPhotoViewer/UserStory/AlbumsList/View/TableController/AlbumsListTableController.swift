//
//  AlbumsListTableController.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/5/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol AlbumsListTableControllerDelegate: AnyObject {
    
    func didSelectCell(_ model: AlbumsListCellViewModel)
    func didFinishDataSourceUpdates()
}

final class AlbumsListTableController: NSObject {
    
    weak var delegate: AlbumsListTableControllerDelegate?
    
    private var models: [AlbumsListCellViewModel] = []
    
    private let tableView: UITableView
    private let tableViewUpdatesQueue: DispatchQueue = DispatchQueue(label: "\(AlbumsListTableController.self).list.diffs", qos: .userInteractive, attributes: [], autoreleaseFrequency: .workItem, target: nil)
    
    // MARK: - Life cycle
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        tableView.registerCellClass(AlbumsListCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellClass(AlbumsListCell.self)
    }
    
    // MARK: - Public
    func update(with models: [AlbumsListCellViewModel]) {
        tableViewUpdatesQueue.async { [weak self] in
            self?.models = models
            self?.delegate?.didFinishDataSourceUpdates()
        }
    }
}

// MARK: - UITableViewDataSource
extension AlbumsListTableController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(AlbumsListCell.self, for: indexPath)
        cell.update(with: models[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AlbumsListTableController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        delegate?.didSelectCell(model)
    }
}
