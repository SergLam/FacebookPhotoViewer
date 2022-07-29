//
//  UserAlbumsCoordinator.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class UserAlbumsCoordinator: UserAlbumsCoordinatorProtocol {
    
    var id: UUID = UUID()
    
    var type: CoordinatorType = .userAlbums
    
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
        let viewController = AlbumsListScreenBuilder.makeModule(with: (), coordinator: self)
        UIView.transition(with: navigationController.view, duration: 0.75, options: .transitionFlipFromRight, animations: { [weak self] in
            self?.navigationController.setViewControllers([viewController], animated: true)
        })
    }
    
    func openAlbumDetails(model: FBPhotoAlbum) {
        let viewController = AlbumPhotosScreenBuilder.makeModule(with: model, coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func openPhotoDetails(model: FBAlbumPhotoData) {
        let viewController = ViewPhotoScreenBuilder.makeModule(with: model, coordinator: self)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func logOut() {
        AlertPresenter.showLogOutAlert(at: navigationController, logOutClosure: {
            AppDelegate.shared.appCoordinator.logOut()
        })
    }
    
    func childDidFinish(_ child: Coordinator) {
        
    }
    
    func finish() {
        
    }
}
