//
//  SignInScreenBuilder.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

final class SignInScreenBuilder {
    
    class func makeModule(with model: Void, coordinator: SignInCoordinatorProtocol) -> SignInViewControllerProtocol {
        
        let viewModel: SignInViewModel = SignInViewModel()
        viewModel.coordinator = coordinator
        let loginVC: SignInViewController = SignInViewController(viewModel: viewModel)
        return loginVC
    }
}
