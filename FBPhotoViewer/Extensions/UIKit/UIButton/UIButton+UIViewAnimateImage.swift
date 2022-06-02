//
//  UIButton+UIViewAnimateImage.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/9/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setImageUIViewAnimated(_ image: UIImage?) {
        
        let options: UIView.AnimationOptions = [.curveEaseInOut, .allowAnimatedContent, .allowUserInteraction]
        
        // Old image scale animation
        UIView.animate(withDuration: 0.167, delay: 0.0, options: options, animations: {
            
            self.imageView?.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            
        }, completion: { _ in
            
            // Set the new image itself
            self.setImage(image, for: self.state)
            
            // New image scale animation
            UIView.animate(withDuration: 0.167, delay: 0.0, options: options, animations: {
                
                self.imageView?.transform = CGAffineTransform.identity
                
            }, completion: nil)
            
            // New image alpha animation
            UIView.animate(withDuration: 0.083, delay: 0.0, options: options, animations: {
                
                self.imageView?.alpha = 1.0
                
            }, completion: nil)
            
        })
        
        // Old image alpha animation
        UIView.animate(withDuration: 0.083, delay: 0.083, options: options, animations: {
            
            self.imageView?.alpha = 0.0
            
        }, completion: nil)
        
    }
}
