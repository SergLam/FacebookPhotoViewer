//
//  SignInViewModelProtocol.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 7/28/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol SignInViewModelProtocol {
    
    var coordinator: SignInCoordinatorProtocol?  { get set }
    
    var delegate: SignInViewModelDelegate? { get set }
    
    var keyChainService: KeyChainServiceProtocol { get set }
    
    func signInViaFB(_ vc: UIViewController)
}
