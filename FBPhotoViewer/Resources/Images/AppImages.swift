//
//  AppImages.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 6/2/23.
//  Copyright © 2023 Serg Liamtsev. All rights reserved.
//

import Foundation
import UIKit

/// App Images access control struct.
struct AppImages {
    
    private static var imagesBundle: Bundle {
        return Bundle.main
    }
    
    static var appLogo: UIImage? {
        return UIImage(named: "app-logo", in: imagesBundle, compatibleWith: nil)
    }
    
    static var appLogoZoom: UIImage? {
        return UIImage(named: "app-logo-zoom", in: imagesBundle, compatibleWith: nil)
    }
    
    static var cameraIcon: UIImage? {
        return UIImage(named: "camera-icon", in: imagesBundle, compatibleWith: nil)
    }
    
    static var galleryIcon: UIImage? {
        return UIImage(named: "gallery-icon", in: imagesBundle, compatibleWith: nil)
    }
    
    static var cancelCross: UIImage? {
        return UIImage(named: "cancel-cross", in: imagesBundle, compatibleWith: nil)
    }
    
    static var fbLogoBlack: UIImage? {
        return UIImage(named: "fb-logo-black", in: imagesBundle, compatibleWith: nil)
    }
    
    static var fbLogoWhite: UIImage? {
        return UIImage(named: "fb-logo-white", in: imagesBundle, compatibleWith: nil)
    }
    
    static var likeIcon: UIImage? {
        return UIImage(named: "like-icon", in: imagesBundle, compatibleWith: nil)
    }
    
    static var loginButton: UIImage? {
        return UIImage(named: "login-button", in: imagesBundle, compatibleWith: nil)
    }
    
    static var postImage: UIImage? {
        return UIImage(named: "post-image", in: imagesBundle, compatibleWith: nil)
    }
    
    static var shareIcon: UIImage? {
        return UIImage(named: "share-icon", in: imagesBundle, compatibleWith: nil)
    }
    
    static var placeholder: UIImage? {
        return UIImage(named: "placeholder", in: imagesBundle, compatibleWith: nil)
    }
    
    static var authLogo: UIImage? {
        return UIImage(named: "auth-logo", in: imagesBundle, compatibleWith: nil)
    }
    
    static var authLogoZoom: UIImage? {
        return UIImage(named: "auth-logo-zoom", in: imagesBundle, compatibleWith: nil)
    }
    
    // MARK: - Tab Bar
    
    static var tabBarFeedFilled: UIImage? {
        return UIImage(named: "tab-bar-feed-filled", in: imagesBundle, compatibleWith: nil)
    }
    
    static var tabBarFeedOutlined: UIImage? {
        return UIImage(named: "tab-bar-feed-outlined", in: imagesBundle, compatibleWith: nil)
    }
    
    static var tabBarUserProfileFilled: UIImage? {
        return UIImage(named: "tab-bar-user-profile-filled", in: imagesBundle, compatibleWith: nil)
    }
    
    static var tabBarUserProfileOutlined: UIImage? {
        return UIImage(named: "tab-bar-user-profile-outlined", in: imagesBundle, compatibleWith: nil)
    }
    
    // MARK: - UserProfile
    
    static var clearTextIcon: UIImage? {
        return UIImage(named: "clear-text-icon", in: imagesBundle, compatibleWith: nil)
    }
    
    static var myProfileHeaderBackground: UIImage? {
        return UIImage(named: "my-profile-header-background", in: imagesBundle, compatibleWith: nil)
    }
    
    static var myProfileLogOutIcon: UIImage? {
        return UIImage(named: "my-profile-log-out-icon", in: imagesBundle, compatibleWith: nil)
    }
    
    static var profilePlaceholder: UIImage? {
        return UIImage(named: "profile-placeholder", in: imagesBundle, compatibleWith: nil)
    }
    
    static var takePhotoIcon: UIImage? {
        return UIImage(named: "take-photo-icon", in: imagesBundle, compatibleWith: nil)
    }   
}
