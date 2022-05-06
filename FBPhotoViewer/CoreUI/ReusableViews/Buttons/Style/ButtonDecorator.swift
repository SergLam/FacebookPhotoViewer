//
//  ButtonDecorator.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation
import UIKit

final class ButtonDecorator {
    
    public static func decorate(button: BasicButton, style: ButtonStyle) {
        applyBackgroundColor(style, button)
        
        if style.isRounded {
            button.layer.cornerRadius = button.frame.size.height / 2
        } else {
            button.layer.cornerRadius = style.cornerRadius
        }
        button.setTitleColor(style.titleColor, for: .normal)
        button.titleEdgeInsets = style.titleEdgeInsets
        
        let font = style.titleFont
        
        button.titleLabel?.font = font
        button.titleLabel?.adjustsFontSizeToFitWidth = style.adjustFontSize
        button.titleLabel?.minimumScaleFactor = style.minimumTitleScaleFactor
        button.titleLabel?.textAlignment = style.titleAlignment
        
        button.contentEdgeInsets = style.contentEdgeInsets
        
        if let image = style.image {
            button.setImage(image, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageView?.clipsToBounds = true
            button.imageView?.isHidden = false
            button.imageView?.isUserInteractionEnabled = true
        } else {
            button.setImage(nil, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageView?.clipsToBounds = true
            button.imageView?.isHidden = true
            button.imageView?.isUserInteractionEnabled = false
        }
        button.imageView?.contentMode = style.imageMode
        
        if let backImage = style.backgroundImage {
            button.setBackgroundImage(backImage, for: .normal)
            button.imageView?.isUserInteractionEnabled = true
        } else {
            button.setBackgroundImage(nil, for: .normal)
            button.imageView?.isUserInteractionEnabled = false
        }
        
        if let color = style.imageColor {
            button.tintColor = color
            button.imageView?.tintColor = color
            button.imageView?.alpha = color.rgba.alpha
        }
        
        let insets = style.imageEdgeInsets
        button.imageEdgeInsets = insets
        
        button.contentHorizontalAlignment = style.contentHorizontalAlignment
        
        button.clipsToBounds = style.isClipToBounds
        
        button.layer.borderWidth = style.borderWidth
        button.layer.borderColor = style.borderColor.cgColor
    }
    
    public static func changeIsActiveState(button: UIButton, style: ButtonStyle) {
        applyBackgroundColor(style, button)
    }
    
    public static func applyImage(button: UIButton, style: ButtonStyle) {
        button.setImage(style.image, for: .normal)
    }
    
    private static func applyBackgroundColor(_ style: ButtonStyle, _ button: UIButton) {
        
        if style.backgroundColor.count > 1 {
            button.applyGradient(colours: style.backgroundColor)
        } else {
            button.backgroundColor = style.backgroundColor[0]
        }
    }
    
}
