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
        let vc = AlbumsListViewController(viewModel: AlbumsListViewModel())
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator) {
        
    }
    
    func finish() {
        
    }
}
