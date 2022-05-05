//
//  FBGraphAPIRequestModelProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/5/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol FBGraphAPIRequestModelProtocol {
    
    var path: String { get }
    var parameters: [String: Any] { get set }
}
