//
//  SignInView.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 3/13/19.
//  Copyright © 2019 serglam. All rights reserved.
//

import UIKit

protocol SignInViewDelegate: AnyObject {
    func didTapFBLoginButton()
}

final class SignInView: UIView {
    
    weak var delegate: SignInViewDelegate?
    
    private let fbLoginButton = UIButton()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        
        backgroundColor = UIColor.white
        
        addSubview(fbLoginButton)
        let buttonHeight: CGFloat = 46
        fbLoginButton.backgroundColor = .facebookLogo
        fbLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        fbLoginButton.titleLabel?.adjustsFontSizeToFitWidth = true
        fbLoginButton.titleLabel?.minimumScaleFactor = 0.5
        fbLoginButton.setTitle(Localizable.signInFbLoginButtonTitle(), for: .normal)
        fbLoginButton.setTitleColor(.white, for: .normal)
        fbLoginButton.layer.cornerRadius = buttonHeight / 2
        
        fbLoginButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(buttonHeight)
        }
        
        fbLoginButton.addAction = { [unowned self] in
            self.delegate?.didTapFBLoginButton()
        }
    }
}
