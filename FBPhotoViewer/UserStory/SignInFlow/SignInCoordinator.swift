//
//  SignInCoordinator.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class SignInCoordinator: SignInCoordinatorProtocol {
    
    var id: UUID = UUID()
    
    var type: CoordinatorType = .signIn
    
    var navigationController: UINavigationController
    
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var diContainer: AppDIContainer
    
    // MARK: - Life cycle
    init(navigationController: UINavigationController, diContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
    }
    
    func start() {
        let viewController = SignInScreenBuilder.makeModule(with: (), coordinator: self)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func childDidFinish(_ child: Coordinator) {
        
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
}
