//
//  FBGraphAPIManagerProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/20/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol FBGraphAPIManagerProtocol: AnyObject {
    
    func getUserProfile(completion: @escaping (Result<UserJSON, Error>) -> Void)
}
