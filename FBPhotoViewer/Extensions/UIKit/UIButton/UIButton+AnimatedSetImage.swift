//
//  UIButton+AnimatedSetImage.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setImage(_ image: UIImage?, animated: Bool = false, reversed: Bool = false, color: UIColor) {
        
        guard animated else {
            setImage(image, for: .normal)
            return
        }
        
        let animationDuration: TimeInterval = 3.0
        
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
        
        var scaleValues: [CATransform3D] = []
        var scaleKeyTimes: [Float] = []
        
        // Start scale
        if !reversed {
            scaleValues.append(CATransform3DMakeScale(0.0, 0.0, 0.0))
        } else {
            scaleValues.append(CATransform3DMakeScale(1.0, 1.0, 1.0))
        }
        scaleKeyTimes.append(0.0)

        // Bounce scale
        if !reversed {
            scaleValues.append(CATransform3DMakeScale(1.35, 1.35, 1.35))
        } else {
            scaleValues.append(CATransform3DMakeScale(0.65, 0.65, 0.65))
        }
        scaleKeyTimes.append(0.5)
        
        // End scale
        if !reversed {
            scaleValues.append(CATransform3DMakeScale(1.0, 1.0, 1.0))
        } else {
            scaleValues.append(CATransform3DMakeScale(0.0001, 0.0001, 0.0001))
        }
        scaleKeyTimes.append(1.0)
        
        // Scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform")
        scaleAnimation.values = scaleValues.map{ NSValue(caTransform3D: $0) }
        scaleAnimation.keyTimes = scaleKeyTimes.map{ NSNumber(value: $0 as Float) }
        scaleAnimation.isRemovedOnCompletion = true
        scaleAnimation.fillMode = CAMediaTimingFillMode.forwards
        scaleAnimation.duration = animationDuration
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        // Alpha animation
        let alphaAnimation = CAKeyframeAnimation(keyPath: "opacity")
        alphaAnimation.values = [0.0, 0.5, 1.0]
        alphaAnimation.keyTimes = scaleKeyTimes.map{ NSNumber(value: $0 as Float) }
        alphaAnimation.isRemovedOnCompletion = true
        scaleAnimation.fillMode = CAMediaTimingFillMode.forwards
        scaleAnimation.duration = animationDuration
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        // TODO: - https://developer.apple.com/documentation/quartzcore/caanimationgroup
        
        imageView?.layer.add(scaleAnimation, forKey: "animateScale")
        imageView?.layer.add(alphaAnimation, forKey: "animateAlpha")
        
        setImage(templateImage, for: .normal)
    }
}
