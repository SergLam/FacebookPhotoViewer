//
//  UniqueIdentifiable.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol UniqueIdentifiable {
    
    var identifier: UUID { get set }
}
