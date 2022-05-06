//
//  LabelStyle.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

struct LabelStyle {
    
    let backgroundColor: UIColor?
    let textColor: UIColor?
    let font: UIFont
    let textAlignment: NSTextAlignment?
    let isRounded: Bool
    let cornerRadius: CGFloat
    
    init(backgroundColor: UIColor? = nil,
         textColor: UIColor?,
         font: UIFont,
         textAlignment: NSTextAlignment? = NSTextAlignment.natural,
         isRounded: Bool = false,
         cornerRadius: CGFloat = 0) {
        
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.font = font
        self.isRounded = isRounded
        self.cornerRadius = cornerRadius
    }
    
}
