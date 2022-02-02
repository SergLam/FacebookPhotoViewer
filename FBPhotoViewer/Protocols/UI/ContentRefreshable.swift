//
//  ContentRefreshable.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol ContentRefreshable: AnyObject {
    
    var identifier: UUID { get set }
    
    func refreshContent()
    
    func startSilentContentRefreshing()
    
    func stopSilentContentRefreshing()
    
}
