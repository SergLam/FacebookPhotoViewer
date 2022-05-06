//
//  FacebookSignInButton.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

public final class FacebookSignInButton: BasicButton {
    
    private let buttonStyle: ButtonStyle = UIProvider.global.facebookSignInButton
    
    // MARK: - Styling
    override func style() {
        ButtonDecorator.decorate(button: self, style: buttonStyle)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        if buttonStyle.isRounded {
            layer.cornerRadius = frame.height / 2
        }
    }
}
