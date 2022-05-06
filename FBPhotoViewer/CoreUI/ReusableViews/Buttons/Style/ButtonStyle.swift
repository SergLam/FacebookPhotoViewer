//
//  ButtonStyle.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

struct ButtonStyle {
    
    let backgroundColor: [UIColor?]
    let backgroundImage: UIImage?
    let cornerRadius: CGFloat
    let isRounded: Bool
    
    let borderWidth: CGFloat
    let borderColor: UIColor
    
    let titleColor: UIColor?
    let titleFont: UIFont?
    let titleAlignment: NSTextAlignment
    let adjustFontSize: Bool
    let minimumTitleScaleFactor: CGFloat
    
    let titleEdgeInsets: UIEdgeInsets
    let contentEdgeInsets: UIEdgeInsets
    let image: UIImage?
    let imageMode: UIView.ContentMode
    let imageColor: UIColor?
    let imageEdgeInsets: UIEdgeInsets
    let contentHorizontalAlignment: UIControl.ContentHorizontalAlignment
    let isClipToBounds: Bool
    
    init(backgroundColor: [UIColor?] = [.clear],
         backgroundImage: UIImage? = nil,
         cornerRadius: CGFloat = 0,
         isRounded: Bool = false,
         borderWidth: CGFloat = .zero,
         borderColor: UIColor = .white,
         titleColor: UIColor? = .white,
         titleFont: UIFont? = nil,
         titleAlignment: NSTextAlignment = .center,
         adjustFontSize: Bool = false,
         minimumTitleScaleFactor: CGFloat = 0.5,
         attributedTitle: NSAttributedString? = nil,
         titleEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero,
         contentEdgeInsets: UIEdgeInsets = .zero,
         image: UIImage? = nil,
         imageMode: UIView.ContentMode = .scaleAspectFit,
         imageColor: UIColor? = nil,
         imageEdgeInsets: UIEdgeInsets = UIEdgeInsets.zero,
         contentHorizontalAlignment: UIControl.ContentHorizontalAlignment = .center,
         isClipToBounds: Bool = true) {
        
        self.backgroundColor = backgroundColor
        self.backgroundImage = backgroundImage
        self.cornerRadius = cornerRadius
        self.isRounded = isRounded
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.titleAlignment = titleAlignment
        self.adjustFontSize = adjustFontSize
        self.minimumTitleScaleFactor = minimumTitleScaleFactor
        self.titleEdgeInsets = titleEdgeInsets
        self.contentEdgeInsets = contentEdgeInsets
        self.image = image
        self.imageMode = imageMode
        self.imageColor = imageColor
        self.imageEdgeInsets = imageEdgeInsets
        self.contentHorizontalAlignment = contentHorizontalAlignment
        self.isClipToBounds = isClipToBounds
    }
    
}
