//
//  ViewController.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/11/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    let viewModel = SignInVM()
    let contentView = SignInView()
    
    override func loadView() {
       view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }
    
}

extension SignInVC: SignInViewDelegate {
    
    func didTapFBLoginButton() {
        viewModel.signUpViaFB(self)
    }
    
}
