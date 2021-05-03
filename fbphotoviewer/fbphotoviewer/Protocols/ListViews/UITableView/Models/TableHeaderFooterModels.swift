//
//  TableHeaderFooterModels.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

enum TableHeaderFooterType: Int {
    
    case emptyHeaderFooterView = 0
}

protocol TableHeaderFooterModel {
    
    var type: TableHeaderFooterType { get }
    
    var rowHeight: CGFloat { get } // UITableView.automaticDimension if your cell should have content-dependent height
}
