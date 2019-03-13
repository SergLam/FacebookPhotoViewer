//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `LaunchImage`.
    static let launchImage = Rswift.ImageResource(bundle: R.hostingBundle, name: "LaunchImage")
    
    /// `UIImage(named: "LaunchImage", bundle: ..., traitCollection: ...)`
    static func launchImage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.launchImage, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 4 localization keys.
    struct localizable {
      /// Value: Continue with Facebook
      static let signInFbLoginButtonTitle = Rswift.StringResource(key: "sign-in.fb-login.button.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Facebook Autorization - unable to get result
      static let errorFbEmptyResult = Rswift.StringResource(key: "error.fb-empty-result", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Facebook Autorization canceled by user
      static let errorFbCanceledByUser = Rswift.StringResource(key: "error.fb-canceled-by-user", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Failed to get access token
      static let errorFbAccessTokenNil = Rswift.StringResource(key: "error.fb-access-token-nil", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: Continue with Facebook
      static func signInFbLoginButtonTitle(_: Void = ()) -> String {
        return NSLocalizedString("sign-in.fb-login.button.title", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Facebook Autorization - unable to get result
      static func errorFbEmptyResult(_: Void = ()) -> String {
        return NSLocalizedString("error.fb-empty-result", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Facebook Autorization canceled by user
      static func errorFbCanceledByUser(_: Void = ()) -> String {
        return NSLocalizedString("error.fb-canceled-by-user", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Failed to get access token
      static func errorFbAccessTokenNil(_: Void = ()) -> String {
        return NSLocalizedString("error.fb-access-token-nil", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if #available(iOS 11.0, *) {
        }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
