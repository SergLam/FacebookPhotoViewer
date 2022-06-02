//
//  UIButton+SetImage.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/9/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setImageAnimated(_ image: UIImage?, color: UIColor) {
        
        let templateImage = image?.withRenderingMode(.alwaysTemplate)
        tintColor = color
        
        let animationDuration: TimeInterval = 1.0
        let animationDelay: TimeInterval = animationDuration / 2
        
        // Old icon animation
        let fadeOut = CABasicAnimation(keyPath: "opacity")
        fadeOut.fromValue = 1.0
        fadeOut.toValue = 0.0
        fadeOut.duration = animationDuration / 2
        fadeOut.beginTime = CACurrentMediaTime()
        fadeOut.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let collapseScale = CABasicAnimation()
        collapseScale.keyPath = "transform"
        collapseScale.valueFunction = CAValueFunction(name: CAValueFunctionName.scale)
        collapseScale.fromValue = [1, 1, 1]
        collapseScale.toValue = [0.85, 0.85, 0.85]
        collapseScale.duration = animationDuration / 2
        collapseScale.beginTime = CACurrentMediaTime()
        collapseScale.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        // New icon animation
        let fadeIn = CABasicAnimation(keyPath: "opacity")
        fadeIn.fromValue = 0.0
        fadeIn.toValue = 1.0
        fadeIn.duration = animationDuration
        fadeIn.beginTime = CACurrentMediaTime()// + animationDelay
        fadeIn.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let expandScale = CABasicAnimation()
        expandScale.keyPath = "transform"
        expandScale.valueFunction = CAValueFunction(name: CAValueFunctionName.scale)
        expandScale.fromValue = [0.85, 0.85, 0.85]
        expandScale.toValue = [1, 1, 1]
        expandScale.duration = animationDuration
        expandScale.beginTime = CACurrentMediaTime()// + animationDelay
        expandScale.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let oldIconAnimationGroup = CAAnimationGroup()
        oldIconAnimationGroup.animations = [fadeOut, collapseScale]
        oldIconAnimationGroup.duration = animationDuration
        
        imageView?.layer.add(oldIconAnimationGroup, forKey: nil)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay, execute: { [weak self] in
//            self?.setImage(templateImage, for: .normal)
//
//            let newIconAnimationGroup = CAAnimationGroup()
//            newIconAnimationGroup.animations = [fadeIn, expandScale]
//            newIconAnimationGroup.duration = animationDuration
//
//            self?.imageView?.layer.add(oldIconAnimationGroup, forKey: nil)
//        })
        
    }
}
