//
//  LocalizedStrings.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 6/2/23.
//  Copyright © 2023 Serg Liamtsev. All rights reserved.
//

import Foundation
import UIKit

/// Localizable strings access control struct.
struct LocalizedStrings {
    
    // NOTE: - Change bundle, if you would like to have language change in runtime
    private static var stringsBundle: Bundle {
        let localeCode = UserDefaults.shared.selectedLocaleCode
        guard let bundlePath = Bundle.main.path(forResource: localeCode, ofType: "lproj"), let bundle = Bundle(path: bundlePath) else {
            return Bundle.main
        }
        return bundle
    }
    
    // MARK: - General
    static var ok: String {
        NSLocalizedString("ok", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var cancel: String {
        NSLocalizedString("cancel", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var error: String {
        NSLocalizedString("cancel", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var success: String {
        NSLocalizedString("success", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var back: String {
        NSLocalizedString("back", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var loading: String {
        NSLocalizedString("loading", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var appName: String {
        NSLocalizedString("app-name", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Facebook errors
    static var errorFbEmptyResult: String {
        NSLocalizedString("error.fb-empty-result", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var errorFbCanceledByUser: String {
        NSLocalizedString("error.fb-canceled-by-user", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var errorFbAccessTokenNil: String {
        NSLocalizedString("error.fb-access-token-nil", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Sign In
    
    static var signInFbLoginScreenTitle: String {
        NSLocalizedString("sign-in.fb-login.screen-title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var signInFbLoginButtonTitle: String {
        NSLocalizedString("sign-in.fb-login.button.title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Albums List
    
    static var albumsListScreenTitle: String {
        NSLocalizedString("albums-list.screen-title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var albumsListEmptyStateTitle: String {
        NSLocalizedString("albums-list.empty-state-title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Albums list nav bar items
    
    static var albumsListNavBarLogOut: String {
        NSLocalizedString("albums-list.nav-bar.log-out", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }

    // MARK: - View photo
    
    static var viewPhotoTitle: String {
        NSLocalizedString("view-photo.title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Email sending errors
    
    static var emailSendFail: String {
        NSLocalizedString("email.send.fail", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var emailSendSuccess: String {
        NSLocalizedString("email.send.success", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var emailSendNotConfigured: String {
        NSLocalizedString("email.send.not-configured", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Tab bar items title
    
    static var tabBarFeedTitle: String {
        NSLocalizedString("tab-bar.feed-title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var tabBarProfileTitle: String {
        NSLocalizedString("tab-bar.profile-title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    // MARK: - Log out alert
    
    static var logOutAlertTitle: String {
        NSLocalizedString("log-out-alert.title", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
    
    static var logOutAlertText: String {
        NSLocalizedString("log-out-alert.text", tableName: nil, bundle: stringsBundle, value: "", comment: "")
    }
}
