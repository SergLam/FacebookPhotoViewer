//
//  SignInVM.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/12/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import FBSDKCoreKit

protocol SignInVMDelegate: class {
    func onSignInError(_ error: String)
    func onSignInSuccess()
}

class SignInVM {
    
    weak var delegate: SignInVMDelegate?
    
    func signUpViaFB(_ vc: UIViewController){
        FBSDKLoginManager().logOut()
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile", "email"], from: vc){ [weak self](result, error) in
            if let err = error {
                self?.delegate?.onSignInError(err.localizedDescription)
                return
            }
            guard let result = result else {
                self?.delegate?.onSignInError(Localizable.errorFbEmptyResult())
                return
            }
            guard !result.isCancelled else {
                self?.delegate?.onSignInError(Localizable.errorFbCanceledByUser())
                return
            }
            guard let accessToken = FBSDKAccessToken.current() else {
                self?.delegate?.onSignInError(Localizable.errorFbAccessTokenNil())
                return
            }
            // TODO: save tokens for re-authentication
            debugPrint(accessToken)
            self?.delegate?.onSignInSuccess()
        }
    }
    
}
