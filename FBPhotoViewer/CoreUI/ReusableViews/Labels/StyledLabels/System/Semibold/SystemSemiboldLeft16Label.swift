//
//  SystemSemiboldLeft16Label.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/6/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import UIKit

final class SystemSemiboldLeft16Label: BasicLabel {
    
    override func style() {
        LabelDecorator.decorate(label: self, style: UIProvider.global.systemSemiboldLeft16Label)
    }
    
}
