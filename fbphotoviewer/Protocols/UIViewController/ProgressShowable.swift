//
//  ProgressShowable.swift
//  fbphotoviewer
//
//  Created by Serg Liamthev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import PKHUD
import UIKit

protocol ProgressShowable {
    
    func showProgress()
    func hideProgress()
    func hideProgress(completion: @escaping VoidClosure)
}

extension ProgressShowable where Self: BaseViewController {
    
    func showProgress() {
        
        executeOnMain { [weak self] in
            guard let self = self else { return }
//            let text: String = Localizable.loading(preferredLanguages: [UserDefaults.shared.selectedLocaleCode])
            HUD.show(.labeledProgress(title: nil, subtitle: nil), onView: self.view)
        }
    }
    
    func showProgress(_ text: String? = nil) {
        
        executeOnMain { [weak self] in
            guard let self = self else { return }
//            let text: String = Localizable.loading(preferredLanguages: [UserDefaults.shared.selectedLocaleCode])
            HUD.show(.labeledProgress(title: nil, subtitle: nil), onView: self.view)
        }
    }
    
    func hideProgress() {
        
        executeOnMain {
            HUD.hide(animated: true)
        }
    }
    
    func hideProgress(completion: @escaping VoidClosure) {
        
        executeOnMain {
            HUD.hide(animated: true)
            completion()
        }
    }
}
