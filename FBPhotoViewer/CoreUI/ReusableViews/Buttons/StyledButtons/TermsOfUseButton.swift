//
//  TermsOfUseButton.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

public final class TermsOfUseButton: BasicButton {
    
    // MARK: - Styling
    override func style() {
        ButtonDecorator.decorate(button: self, style: UIProvider.global.termsOfUseButton)
        setupTitle()
    }
    
    // MARK: - Public functions
    func update(with style: ButtonStyle) {
        
        ButtonDecorator.decorate(button: self, style: style)
    }
    
    private func setupTitle() {
        
        let appFont = UIFont.systemFont(ofSize: 14, weight: .regular)
        let buttonText: String = "Terms of use"
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        attributes[.font] = appFont
        attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        
        let attributedTextForButton = NSMutableAttributedString(string: buttonText,
                                                                attributes: attributes)
        
        setAttributedTitle(attributedTextForButton, for: .normal)
        titleLabel?.textColor = UIProvider.global.textColor
    }
    
}
