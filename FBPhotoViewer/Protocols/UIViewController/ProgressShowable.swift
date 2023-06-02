//
//  ProgressShowable.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol ProgressShowable {
    
    func showProgress(_ title: String?)
    func hideProgress(completion: VoidClosure?)
}

extension ProgressShowable where Self: BaseViewController {
    
    func showProgress(_ title: String? = LocalizedStrings.loading) {
        
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            `self`.addChild(self.progressViewController)
            `self`.progressViewController.view.frame = `self`.view.frame
            `self`.view.addSubview(`self`.progressViewController.view)
            `self`.progressViewController.didMove(toParent: `self`)
            `self`.progressViewController.showProgress(title)
        }
    }
    
    func hideProgress(completion: VoidClosure? = nil) {
        
        DispatchQueue.main.async { [weak self] in
            
            self?.progressViewController.hideProgress(completion: { [weak self] in
                
                self?.progressViewController.willMove(toParent: nil)
                self?.progressViewController.view.removeFromSuperview()
                self?.progressViewController.removeFromParent()
                completion?()
            })
        }
    }
}
