//
//  ViewController.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/11/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import FBSDKCoreKit
import UIKit

final class SignInVC: BaseViewController {
    
    private let viewModel = SignInVM()
    private let contentView = SignInView()
    
    // MARK: - Life cycle
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        viewModel.delegate = self
        navigationItem.title = Localizable.signInFbLoginScreenTitle()
    }
    
}

// MARK: - SignInViewDelegate
extension SignInVC: SignInViewDelegate {
    
    func didTapFBLoginButton() {
        showProgress()
        viewModel.signInViaFB(self)
    }
    
}

// MARK: - SignInVMDelegate
extension SignInVC: SignInVMDelegate {
    
    func onSignInError(_ error: String) {
        executeOnMain { [weak self] in
            guard let `self` = self else { return }
            self.hideProgress()
            AlertPresenter.showErrorAlert(on: self, error: error)
        }
    }
    
    func didUserCancelSignIn() {
        executeOnMain { [weak self] in
            self?.hideProgress()
        }
    }
    
    func onSignInSuccess() {
        executeOnMain { [weak self] in
            self?.hideProgress()
            let vc = AlbumsListVC()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
