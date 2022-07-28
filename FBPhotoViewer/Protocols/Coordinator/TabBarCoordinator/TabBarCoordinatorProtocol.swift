//
//  TabBarCoordinatorProtocol.swift
//  FBPhotoViewer
//
// Created by Serg Liamtsev on 07.28.2022.
// Copyright © 2022 Serg Liamtsev. All rights reserved.

import UIKit

protocol TabBarCoordinatorProtocol: Coordinator {
    
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func currentPage() -> TabBarPage
}
