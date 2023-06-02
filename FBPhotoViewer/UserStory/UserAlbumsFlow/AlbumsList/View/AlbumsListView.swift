//
//  AlbumsView.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

final class AlbumsView: UIView {
    
    private(set) var tableView = UITableView()
    private let emptyStateView: EmptyListStateView = EmptyListStateView()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func setEmptyListViewVisibility(isHidden: Bool) {
        
        tableView.backgroundView = isHidden ? nil : emptyStateView
        emptyStateView.isHidden = isHidden
    }
    
    // MARK: - Private
    private func setupLayout() {
        backgroundColor = UIColor.white
        
        addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
        tableView.backgroundView = emptyStateView
        emptyStateView.isHidden = true
        emptyStateView.update(title: emptyAlbumsListTitle(), description: nil)
    }
    
    private func emptyAlbumsListTitle() -> NSAttributedString {
        let text = LocalizedStrings.albumsListEmptyStateTitle
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 25, weight: .bold),
            .foregroundColor: UIColor.darkGray]
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        return attributedString
    }
}
