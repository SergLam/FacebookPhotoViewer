//
//  CellModels.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

enum CollectionCellType: String {
    
    case beginScreenItem
    
    case programListMeditationItem
    
}

protocol CollectionCellModel {
    var type: CollectionCellType { get }
}
