//
//  SignInViewController.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/11/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import FBSDKCoreKit
import UIKit

final class SignInViewController: BaseViewController, SignInViewControllerProtocol {
    
    private var viewModel: SignInViewModelProtocol
    private let contentView = SignInView()
    
    // MARK: - Life cycle
    init(viewModel: SignInViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
extension SignInViewController: SignInViewDelegate {
    
    func didTapFBLoginButton() {
        showProgress()
        viewModel.signInViaFB(self)
    }
    
}

// MARK: - SignInViewModelDelegate
extension SignInViewController: SignInViewModelDelegate {
    
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
            let vc = AlbumsListViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
