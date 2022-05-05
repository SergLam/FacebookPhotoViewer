//
//  SignInViewModel.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/12/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import FBSDKCoreKit
import FBSDKLoginKit
import Foundation

protocol SignInViewModelDelegate: AnyObject {
    
    func onSignInError(_ error: String)
    func didUserCancelSignIn()
    func onSignInSuccess()
}

final class SignInViewModel {
    
    weak var delegate: SignInViewModelDelegate?
    
    func signInViaFB(_ vc: UIViewController){
        
        LoginManager().logOut()
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email", "user_photos"], from: vc) { [weak self] result, error in
            if let err = error {
                self?.delegate?.onSignInError(err.localizedDescription)
                return
            }
            guard let result = result else {
                self?.delegate?.onSignInError(Localizable.errorFbEmptyResult())
                return
            }
            guard !result.isCancelled else {
                self?.delegate?.didUserCancelSignIn()
                return
            }
            guard let accessToken = AccessToken.current else {
                self?.delegate?.onSignInError(Localizable.errorFbAccessTokenNil())
                return
            }
            // TODO: save tokens for re-authentication
            debugPrint(accessToken)
            self?.delegate?.onSignInSuccess()
        }
        
    }
    
}
