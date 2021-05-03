//
//  XIBLocalizable.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Localized
public protocol Localized {
    var localized: String { get }
}

extension String: Localized {
    
    public var localized: String {
        // NOTE: - Customer requirment - production app should be ONLY in Spanish
        #if DEBUG
        let language: String = "en"
        #else
        let language: String = "es"
        #endif
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj") else {
            let message: String = "Unable to find lproj file"
            preconditionFailure(message)
        }
        guard let bundle = Bundle(path: path) else {
            let message: String = "Unable to load bundle"
            preconditionFailure(message)
        }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}

// MARK: - XIBLocalizable
public protocol XIBLocalizable {
    var xibLocKey: String? { get set }
}

// MARK: - UILabel
extension UILabel: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get {
            return nil
        }
        set(key) {
            text = key?.localized
        }
    }
}

// MARK: - UIButton
extension UIButton: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get {
            return nil
        }
        set(key) {
            if let attributedTitle = attributedTitle(for: .normal), attributedTitle.length != 0 {
                let attributes = attributedTitle.attributes(at: 0, effectiveRange: nil)
                let attributedLocalizedText = NSMutableAttributedString(string: key?.localized ?? "",
                                                                        attributes: attributes)
                self.setAttributedTitle(attributedLocalizedText, for: .normal)
            } else {
                setTitle(key?.localized, for: .normal)
            }
        }
    }
}

// MARK: - UINavigationItem
extension UINavigationItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get {
            return nil
        }
        set(key) {
            title = key?.localized
        }
    }
}

// MARK: - UIBarItem
extension UIBarItem: XIBLocalizable {
    @IBInspectable public var xibLocKey: String? {
        get {
            return nil
        }
        set(key) {
            title = key?.localized
        }
    }
}

// MARK: - Multiple texts in the same control
public protocol XIBMultiLocalizable {
    var xibLocKeys: String? { get set }
}

extension UISegmentedControl: XIBMultiLocalizable {
    @IBInspectable public var xibLocKeys: String? {
        get {
            return nil
        }
        set(keys) {
            guard let keys = keys?.components(separatedBy: ","), !keys.isEmpty else { return }
            for (index, title) in keys.enumerated() {
                setTitle(title.localized, forSegmentAt: index)
            }
        }
    }
}

// MARK: - UITextField's placeholder
public protocol UITextFieldXIBLocalizable {
    var xibPlaceholderLocKey: String? { get set }
}

extension UITextField: UITextFieldXIBLocalizable {
    @IBInspectable public var xibPlaceholderLocKey: String? {
        get {
            return nil
        }
        set(key) {
            placeholder = key?.localized
        }
    }
}
