//
//  NibLoadable.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoadable {
    var nibName: String { get set }
    var bundle: Bundle { get }
    var className: AnyClass { get set }
}

public extension NibLoadable where Self: UIView {
    
    var nib: UINib {
        return UINib(nibName: nibName, bundle: bundle)
    }
    
    var bundle: Bundle {
        return Bundle(for: className)
    }

    func setupFromNib() {
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupFromNibClass() {
        
        guard let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
            fatalError("Error loading \(self) from nib")
        }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
}
