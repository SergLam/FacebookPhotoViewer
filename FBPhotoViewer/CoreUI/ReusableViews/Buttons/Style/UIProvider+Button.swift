//
//  UIProvider+Button.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIProvider {
    
    var termsOfUseButton: ButtonStyle {
        
        return ButtonStyle(backgroundColor: [.clear], backgroundImage: nil, cornerRadius: 0.0, isRounded: false, borderWidth: 0.0, borderColor: .clear, titleColor: self.textColor, titleFont: UIFont.systemFont(ofSize: 14, weight: .regular), titleEdgeInsets: .zero, contentEdgeInsets: .zero, image: nil, imageColor: nil, imageEdgeInsets: .zero, contentHorizontalAlignment: .center, isClipToBounds: false)
    }
    
    var facebookSignInButton: ButtonStyle {
        return ButtonStyle(backgroundColor: [UIColor.facebookLogo], backgroundImage: nil, cornerRadius: 0.0, isRounded: true, borderWidth: 0.0, borderColor: .clear, titleColor: UIColor.white, titleFont: UIFont.systemFont(ofSize: 16, weight: .bold), titleEdgeInsets: .zero, contentEdgeInsets: .zero, image: UIImage(named: "fb-logo-white"), imageColor: UIColor.white, imageEdgeInsets: .zero, contentHorizontalAlignment: .center, isClipToBounds: false)
    }
}
