//
//  CollectionHeaderFooterModels.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

enum CollectionHeaderFooterType: Int {
    
    case emptyHeaderView = 0
    case emptyFooterView
}

protocol CollectionHeaderFooterModel {
    
    var type: CollectionHeaderFooterType { get }
}
