//
//  AlbumsView.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import SnapKit
import UIKit

final class AlbumsView: UIView {
    
    private(set) var tableView = UITableView()
    
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
        
        addSubview(tableView)
        tableView.backgroundColor = UIColor.white
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
