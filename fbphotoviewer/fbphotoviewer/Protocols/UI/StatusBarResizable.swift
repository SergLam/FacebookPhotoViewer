//
//  StatusBarResizable.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

protocol StatusBarResizable {}

extension StatusBarResizable where Self: UIResponder {
    
    static func calculateStatusBarHeight() -> CGFloat {
        
        if #available(iOS 11.0, *) {
            guard let topInset = UIApplication.shared.keyWindow?.safeAreaInsets.top else {
                let message: String = "Unable to get top inset"
                LoggerService.logErrorWithTrace(message)
                preconditionFailure(message)
            }
            guard topInset == 0 else {
                return topInset
            }
            return 20
        } else {
            return 20
        }
    }
    
}
