//
//  AlertPresenter.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/15/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

final class AlertPresenter: NSObject {
    
    static func showErrorAlert(on viewController: UIViewController, error: String) {
        executeOnMain {
            let alert = UIAlertController(title: LocalizedStrings.error, message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: LocalizedStrings.ok, style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(action)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showSuccessAlert(on viewController: UIViewController,
                                 message: String,
                                 _ completion: VoidClosure?) {
        executeOnMain {
            let alert = UIAlertController(title: LocalizedStrings.success, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: LocalizedStrings.ok, style: .default, handler: { _ in
                completion?()
            })
            alert.addAction(action)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Log out alert
    static func showLogOutAlert(at vc: UIViewController,
                                logOutClosure: @escaping VoidClosure) {
        executeOnMain {
            let title = LocalizedStrings.appName
            let message = LocalizedStrings.logOutAlertText
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let logOutAction = UIAlertAction(title: LocalizedStrings.logOutAlertTitle, style: .default) { _ in
                logOutClosure()
            }
            let cancelAction = UIAlertAction(title: LocalizedStrings.cancel, style: .default) { _ in
                alert.dismiss(animated: true, completion: nil)
            }
            
            alert.addAction(logOutAction)
            alert.addAction(cancelAction)
            alert.preferredAction = logOutAction
            
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
}
