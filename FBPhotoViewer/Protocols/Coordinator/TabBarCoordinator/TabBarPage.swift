//
//  TabBarPage.swift
//  FBPhotoViewer
//
// Created by Serg Liamtsev on 07.28.2022.
// Copyright © 2022 Serg Liamtsev. All rights reserved.

import Foundation

enum TabBarPage: Int, CaseIterable {
    
    case feed = 0
    case myProfile = 1
    
    var pageTitle: String {
        switch self {
        case .feed:
            return LocalizedStrings.tabBarFeedTitle
        case .myProfile:
            return LocalizedStrings.tabBarProfileTitle
        }
    }

    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}
