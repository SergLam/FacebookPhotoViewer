//
//  ViewPhotoViewModel.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/16/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation

final class ViewPhotoViewModel {
    
    let photoURL: String
    
    // MARK: - Life cycle
    init(url: String) {
        self.photoURL = url
    }
}
