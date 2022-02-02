//
//  CellModels.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

enum TableCellType: String {
    
    case slideMenuProfileHeader
    case slideMenuRegularItem
    
    case meditationProgramDetailsTitle
    case meditationProgramRaisedCard
    case meditationProgramLockedCard
    
    case programsList
    case meditationListLogo
    
    case selectPaymentPlan
    
    case changeSubscription
    
    case citySearch
}

protocol TableCellModel {
    
    var type: TableCellType { get }
    
    var rowHeight: CGFloat { get } // UITableView.automaticDimension if your cell should have content-dependent height

}
