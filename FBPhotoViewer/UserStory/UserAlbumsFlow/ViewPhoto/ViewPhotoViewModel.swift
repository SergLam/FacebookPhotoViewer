//
//  ViewPhotoViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/16/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import Foundation

final class ViewPhotoViewModel {
    
    let photoURL: String
    
    // MARK: - Life cycle
    init(url: String) {
        self.photoURL = url
    }
}
