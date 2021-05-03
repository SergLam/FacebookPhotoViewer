//
//  AppDelegate.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/11/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

    var window: UIWindow?

    // TEST USER:
    // qqcjdtzyuy_1552376613@tfbnw.net
    // password123456
    
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Facebook setup
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let rootVC = SignInVC()
        let navVC = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navVC
        
        return true
    }
    
    // MARK: Facebook methods
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return ApplicationDelegate.shared.application(application,
                                                         open: url,
                                                         sourceApplication: sourceApplication,
                                                         annotation: annotation)
    }
    
    @available(iOS 9.0, *)
    func application(_ application: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return ApplicationDelegate.shared.application(application, open: url, options: options)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
}
