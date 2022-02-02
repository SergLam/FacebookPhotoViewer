//
//  BaseViewController.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/3/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import MessageUI
import PKHUD
import SafariServices
import UIKit

class BaseViewController: UIViewController, ProgressShowable, ExternalURLOpenable, StatusBarResizable, UniqueIdentifiable {
    
    var identifier: UUID = UUID()
    
    // MARK: - Life cycle
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSwipeBackGestureState(isEnabled: true)
    }
    
    func changeSwipeBackGestureState(isEnabled: Bool) {
        navigationController?.interactivePopGestureRecognizer?.delegate = isEnabled ? self : nil
    }
    
}

// MARK: - MFMailComposeViewControllerDelegate
extension BaseViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        guard let error = error else {
            
            switch result {
                
            case .cancelled, .saved:
                controller.dismiss(animated: true, completion: nil)
                
            case .failed:
                
                controller.dismiss(animated: true, completion: { [weak self] in
                    
                    guard let self = self else { return }
                    let message = Localizable.emailSendFail(preferredLanguages: [UserDefaults.shared.selectedLocaleCode] )
                    AlertPresenter.showSuccessAlert(on: self, message: message, nil)
                })
                
            case .sent:
                
                controller.dismiss(animated: true, completion: { [weak self] in
                    
                    guard let self = self else { return }
                    let message = Localizable.emailSendSuccess(preferredLanguages: [UserDefaults.shared.selectedLocaleCode])
                    AlertPresenter.showSuccessAlert(on: self, message: message, nil)
                })
                
            @unknown default:
                let message: String = "Unknown MFMailComposeResult value - \(result.rawValue)"
                LoggerService.logErrorWithTrace(message)
            }
            
            return
        }
        
        controller.dismiss(animated: true, completion: { [weak self] in
            
            guard let self = self else { return }
            AlertPresenter.showErrorAlert(on: self, error: error.localizedDescription)
        })
    }
    
}

// MARK: - UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}

// MARK: - SFSafariViewControllerDelegate
extension BaseViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
