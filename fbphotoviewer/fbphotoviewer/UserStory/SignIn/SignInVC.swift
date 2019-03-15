//
//  ViewController.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/11/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class SignInVC: UIViewController {

    let viewModel = SignInVM()
    let contentView = SignInView()
    
    override func loadView() {
       view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        viewModel.delegate = self
    }
    
}

extension SignInVC: SignInViewDelegate {
    
    func didTapFBLoginButton() {
        viewModel.signUpViaFB(self)
    }
    
}

extension SignInVC: SignInVMDelegate {
    
    func onSignInError(_ error: String) {
        AlertPresenter.showErrorAlert(on: self, error: error)
    }
    
    func onSignInSuccess() {
        FBApiManager.shared.getUserProfile(completion: { (user, error) in
            guard let error = error else {
                debugPrint("USER: \(user?.toJSON())")
            }
            AlertPresenter.showErrorAlert(on: self, error: error.localizedDescription)
            
            
        })
    }
    
}
