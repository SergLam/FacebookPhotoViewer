//
//  BasicLabel.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

class BasicLabel: UILabel {
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        style()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        style()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        style()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        style()
    }
    
    func style() { }
    
}
