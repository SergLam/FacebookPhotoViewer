//
//  LabelDecorator.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class LabelDecorator {
    
    public static func decorate(label: BasicLabel, style: LabelStyle) {
        
        if let bgColor = style.backgroundColor {
            label.backgroundColor = bgColor
        }
        label.textColor = style.textColor
        
        if let alignment = style.textAlignment {
            label.textAlignment = alignment
        }
        
        label.font = style.font
        
        label.layer.cornerRadius = style.isRounded ? label.frame.size.height / 2 : style.cornerRadius
        label.layer.masksToBounds = true
    }
    
}
