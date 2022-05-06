//
//  SignInView.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/13/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func didTapFBLoginButton()
}

final class SignInView: UIView {
    
    weak var delegate: SignInViewDelegate?
    
    private let fbLoginButton = FacebookSignInButton()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public
    func setFBImage(animated: Bool = true) {
        
    }
    
    // MARK: - Private
    private func setupLayout() {
        
        backgroundColor = UIColor.white
        
        addSubview(fbLoginButton)
        let buttonHeight: CGFloat = 46
        fbLoginButton.setTitle(Localizable.signInFbLoginButtonTitle(), for: .normal)
        
        fbLoginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fbLoginButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            fbLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            fbLoginButton.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: LayoutConstants.contentInset),
            fbLoginButton.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -LayoutConstants.contentInset),
            fbLoginButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
        
        fbLoginButton.addTarget(self, action: #selector(didTapFBLoginButton), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func didTapFBLoginButton() {
        delegate?.didTapFBLoginButton()
    }
}
