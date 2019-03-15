//
//  AlertPresenter.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/15/19.
//  Copyright © 2019 serglam. All rights reserved.
//
import UIKit
import Closures

class AlertPresenter {
    
    static func showErrorAlert(on viewController: UIViewController, error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: Localizable.error(), message: error, preferredStyle: .alert)
            let action = UIAlertAction(title: Localizable.ok(), style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(action)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
    static func showSucessAlert(on viewController: UIViewController, message: String,
                                _ completion: @escaping ()->()?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: Localizable.success(), message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: Localizable.ok(), style: .default, handler: { _ in
                completion()
            })
            alert.addAction(action)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
    
}
