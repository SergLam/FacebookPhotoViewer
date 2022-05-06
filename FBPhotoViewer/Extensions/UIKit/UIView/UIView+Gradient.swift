//
//  UIView+Gradient.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIView {
    
    enum GradientColorDirection {
        case vertical
        case horizontal
    }
    
    @discardableResult
    func applyGradient(colours: [UIColor?]) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil, type: .horizontal)
    }

    @discardableResult
    func applyGradient(colours: [UIColor?],
                       locations: [NSNumber]?,
                       type: GradientColorDirection) -> CAGradientLayer {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        
        switch type {
        case .vertical:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .horizontal:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        gradient.colors = colours.map { $0?.cgColor ?? UIColor.clear.cgColor }
        gradient.locations = locations
        
        if let oldGradient = self.layer.sublayers?[0] as? CAGradientLayer {
            self.layer.replaceSublayer(oldGradient, with: gradient)
        } else {
            self.layer.insertSublayer(gradient, below: nil)
        }
        
        return gradient
    }
}
