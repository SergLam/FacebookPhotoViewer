//
//  LayoutConstants.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/5/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

struct LayoutConstants {
    
    static let spacing5: CGFloat = 5.0
    static let spacing: CGFloat = 8.0
    static let contentInset: CGFloat = 16.0
    static let tigthBorderWidth: CGFloat = 0.33
    
    static let contentInsetsHorizontal8: UIEdgeInsets = UIEdgeInsets(top: 0,
                                                                     left: LayoutConstants.spacing,
                                                                     bottom: 0,
                                                                     right: LayoutConstants.spacing)
    static let contentInsetsHorizontal16: UIEdgeInsets = UIEdgeInsets(top: 0,
                                                                      left: LayoutConstants.contentInset,
                                                                      bottom: 0,
                                                                      right: LayoutConstants.contentInset)
    
    static let contentInsetsHorizontal34: UIEdgeInsets = UIEdgeInsets(top: 0,
                                                                      left: 34,
                                                                      bottom: 0,
                                                                      right: 34)
    
    static let contentInsetsVertical: UIEdgeInsets = UIEdgeInsets(top: LayoutConstants.spacing,
                                                                  left: 0,
                                                                  bottom: LayoutConstants.spacing,
                                                                  right: 0)
}
