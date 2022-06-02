//
//  UIButton+UIViewAnimateKeyframesImage.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/9/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setImageUIViewAnimatedKeyframes(_ image: UIImage?) {
        
        let totalAnimationDuration: TimeInterval = 2.0 // 0.333
        let halfAnimationDuration: TimeInterval = totalAnimationDuration / 2
        let targetScale: CGFloat = 1.5
        
        let options: UIView.KeyframeAnimationOptions = [.allowUserInteraction, .calculationModeLinear]
        
        // Old image animation
        UIView.animateKeyframes(withDuration: halfAnimationDuration, delay: 0.0, options: options, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.imageView?.transform = CGAffineTransform(scaleX: targetScale, y: targetScale)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.imageView?.alpha = 0.3
            }
            
        }, completion: { _ in
            
            // Set the new image itself
            // self.imageView?.image = image
            self.setImage(image, for: self.state)
            
            // New image animation
            let newOptions: UIView.KeyframeAnimationOptions = [.allowUserInteraction, .calculationModeLinear, .beginFromCurrentState]
            UIView.animateKeyframes(withDuration: halfAnimationDuration, delay: 0, options: newOptions, animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.imageView?.transform = CGAffineTransform.identity
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0) {
                    self.imageView?.alpha = 1.0
                }

            }, completion: { _ in
                
            })
        })
        
    }
}
