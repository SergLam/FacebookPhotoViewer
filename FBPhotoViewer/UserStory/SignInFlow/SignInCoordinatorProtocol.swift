//
//  SignInCoordinatorProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol SignInCoordinatorProtocol: Coordinator {
    
    init(navigationController: UINavigationController, diContainer: AppDIContainer)
}
