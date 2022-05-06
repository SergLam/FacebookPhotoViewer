//
//  UIProvider+Label.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIProvider {
    
    // MARK: - System font semibold
    var systemSemiboldLeft16Label: LabelStyle {
        let textColor = isDarkMode ? UIColor.lightText : UIColor.darkText
        let font: UIFont = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return LabelStyle(textColor: textColor, font: font, textAlignment: .natural, isRounded: false, cornerRadius: 0)
    }
}
