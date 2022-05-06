//
//  UIProvider.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

// NOTE: - Global UI elements styling provider.
// Setup for themes + reusable components styling at runtime
final class UIProvider {
    
    public static let global = UIProvider()
    
    var traitCollection: UITraitCollection {
        return UITraitCollection.current
    }
    
    var isDarkMode: Bool {
        return traitCollection.userInterfaceStyle == .dark
    }
    
    var textColor: UIColor {
        return isDarkMode ? UIColor.lightText : UIColor.darkText
    }
    
    private init() {
        
    }
    
    func configureAppAppearence() {
        
        setUpGlobalNavigationControllerAttribute()
        setUpGlobalAlertControllerApearence()
    }
    
    private func setUpGlobalNavigationControllerAttribute() {
        var textAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
        
        let navBarFont = UIFont.systemFont(ofSize: 18, weight: .regular)
        textAttributes[NSAttributedString.Key.font] = navBarFont
        
        UINavigationBar.appearance().titleTextAttributes = textAttributes
    }
    
    private func setUpGlobalAlertControllerApearence() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = UIColor.systemBlue
    }
    
}
