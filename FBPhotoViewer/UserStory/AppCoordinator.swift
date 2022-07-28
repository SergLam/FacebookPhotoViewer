//
//  AppCoordinator.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    var id: UUID = UUID()
    
    var type: CoordinatorType {
        return .application
    }
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    var keyWindow: UIWindow
    var diContainer: AppDIContainer
    
    init(
        keyWindow: UIWindow,
        diContainer: AppDIContainer
    ) {
        self.keyWindow = keyWindow
        self.diContainer = diContainer
    }
    
    func start() {
        keyWindow.rootViewController = navigationController
        keyWindow.makeKeyAndVisible()
        
        switch diContainer.isUserAuthorized {
        case true:
            startMainFlow()
        case false:
            goToLogInPage()
        }
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in children.enumerated() where coordinator.isEqual(to: child) {
            children.remove(at: index)
            
            switch child.type {
            case .signIn:
                startMainFlow()
            case .userAlbums:
                logOut()
            default:
                assertionFailure("Unknown user flow - \(child.type)")
            }
        }
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func goToLogInPage() {
//        let signInCoordinator = SignInCoordinator(navigationController: navigationController, diContainer: diContainer)
//        signInCoordinator.parentCoordinator = self
//        children.append(signInCoordinator)
//        signInCoordinator.start()
    }
    
    func startMainFlow() {
//        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController, diContainer: diContainer, keyWindow: keyWindow)
//        tabBarCoordinator.parentCoordinator = self
//        children.append(tabBarCoordinator)
//        tabBarCoordinator.start()
    }
    
    func logOut() {
        keyWindow.rootViewController = navigationController
        do {
            try KeyChainService().delete(item: KeyChainItemsHolder.facebookToken)
            goToLogInPage()
        } catch {
            print(error.localizedDescription)
        }
    }
}
