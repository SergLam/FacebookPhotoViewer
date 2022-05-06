//
//  BasicButton.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

public class BasicButton: UIButton {
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        style()
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        style()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        guard let gradient = self.layer.sublayers?[0] as? CAGradientLayer else {
            return
        }
        if gradient.frame != self.bounds {
            gradient.frame = self.bounds
        }
    }
    
    func style() {
    }
    
}
