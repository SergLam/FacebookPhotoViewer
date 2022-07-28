//
//  AppCoordinatorProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

protocol AppCoordinatorProtocol: Coordinator {
    
    func goToLogInPage()
    
    func startMainFlow()
    
    func logOut()
}
