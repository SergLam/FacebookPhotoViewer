//
//  FBGraphAPIManagerProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/20/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol FBGraphAPIManagerProtocol: AnyObject {
    
    var decoder: JSONDecoder { get set }
    
    func getUserProfile(completion: @escaping ResultClosure<UserJSON>)
    
    func getUserAlbums(completion: @escaping ResultClosure<GetMyPhotoAlbumsResponse>)
}
