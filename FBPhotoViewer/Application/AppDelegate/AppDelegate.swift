//
//  AppDelegate.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/11/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder {

    var window: UIWindow?
    
    var appCoordinator: AppCoordinator!
    
    var diContainer = AppDIContainer()
    
    static var shared: AppDelegate {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            let message: String = "Unable to cast app delegate"
            // ErrorLoggerService.logWithTrace(message)
            preconditionFailure(message)
        }
        return delegate
    }
    
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
        appCoordinator = AppCoordinator(keyWindow: window ?? UIWindow(frame: UIScreen.main.bounds), diContainer: diContainer)
        appCoordinator.start()
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
