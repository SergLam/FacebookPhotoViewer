//
//  UIColor+RGBA.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIColor {
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
    
}
