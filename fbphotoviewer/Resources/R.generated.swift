//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `placeholder`.
    static let placeholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "placeholder")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "placeholder", bundle: ..., traitCollection: ...)`
    static func placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.placeholder, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 16 localization keys.
    struct localizable {
      /// Value: Back
      static let back = Rswift.StringResource(key: "back", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancel
      static let cancel = Rswift.StringResource(key: "cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Continue with Facebook
      static let signInFbLoginButtonTitle = Rswift.StringResource(key: "sign-in.fb-login.button.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Error
      static let error = Rswift.StringResource(key: "error", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Facebook Autorization - unable to get result
      static let errorFbEmptyResult = Rswift.StringResource(key: "error.fb-empty-result", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Facebook Autorization canceled by user
      static let errorFbCanceledByUser = Rswift.StringResource(key: "error.fb-canceled-by-user", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Failed to get access token
      static let errorFbAccessTokenNil = Rswift.StringResource(key: "error.fb-access-token-nil", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Mail failed: the email message was not sent. Please check your e-mail settings.
      static let emailSendFail = Rswift.StringResource(key: "email.send.fail", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Mail send: email message sent successfully.
      static let emailSendSuccess = Rswift.StringResource(key: "email.send.success", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: My Albums List
      static let albumsListScreenTitle = Rswift.StringResource(key: "albums-list.screenTitle", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let ok = Rswift.StringResource(key: "ok", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sign In
      static let signInFbLoginScreenTitle = Rswift.StringResource(key: "sign-in.fb-login.screen-title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Success
      static let success = Rswift.StringResource(key: "success", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: User does not have albums yet
      static let albumsListEmptyStateTitle = Rswift.StringResource(key: "albums-list.empty-state-title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: View photo
      static let viewPhotoTitle = Rswift.StringResource(key: "view-photo.title", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Your device has not been configured to send emails. Please sign in to your email at the default iOS Mail app.
      static let emailSendNotConfigured = Rswift.StringResource(key: "email.send.not-configured", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Back
      static func back(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("back", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "back"
        }

        return NSLocalizedString("back", bundle: bundle, comment: "")
      }

      /// Value: Cancel
      static func cancel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("cancel", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "cancel"
        }

        return NSLocalizedString("cancel", bundle: bundle, comment: "")
      }

      /// Value: Continue with Facebook
      static func signInFbLoginButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("sign-in.fb-login.button.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "sign-in.fb-login.button.title"
        }

        return NSLocalizedString("sign-in.fb-login.button.title", bundle: bundle, comment: "")
      }

      /// Value: Error
      static func error(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error"
        }

        return NSLocalizedString("error", bundle: bundle, comment: "")
      }

      /// Value: Facebook Autorization - unable to get result
      static func errorFbEmptyResult(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error.fb-empty-result", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error.fb-empty-result"
        }

        return NSLocalizedString("error.fb-empty-result", bundle: bundle, comment: "")
      }

      /// Value: Facebook Autorization canceled by user
      static func errorFbCanceledByUser(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error.fb-canceled-by-user", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error.fb-canceled-by-user"
        }

        return NSLocalizedString("error.fb-canceled-by-user", bundle: bundle, comment: "")
      }

      /// Value: Failed to get access token
      static func errorFbAccessTokenNil(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error.fb-access-token-nil", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "error.fb-access-token-nil"
        }

        return NSLocalizedString("error.fb-access-token-nil", bundle: bundle, comment: "")
      }

      /// Value: Mail failed: the email message was not sent. Please check your e-mail settings.
      static func emailSendFail(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("email.send.fail", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "email.send.fail"
        }

        return NSLocalizedString("email.send.fail", bundle: bundle, comment: "")
      }

      /// Value: Mail send: email message sent successfully.
      static func emailSendSuccess(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("email.send.success", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "email.send.success"
        }

        return NSLocalizedString("email.send.success", bundle: bundle, comment: "")
      }

      /// Value: My Albums List
      static func albumsListScreenTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("albums-list.screenTitle", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "albums-list.screenTitle"
        }

        return NSLocalizedString("albums-list.screenTitle", bundle: bundle, comment: "")
      }

      /// Value: Ok
      static func ok(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "ok"
        }

        return NSLocalizedString("ok", bundle: bundle, comment: "")
      }

      /// Value: Sign In
      static func signInFbLoginScreenTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("sign-in.fb-login.screen-title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "sign-in.fb-login.screen-title"
        }

        return NSLocalizedString("sign-in.fb-login.screen-title", bundle: bundle, comment: "")
      }

      /// Value: Success
      static func success(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("success", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "success"
        }

        return NSLocalizedString("success", bundle: bundle, comment: "")
      }

      /// Value: User does not have albums yet
      static func albumsListEmptyStateTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("albums-list.empty-state-title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "albums-list.empty-state-title"
        }

        return NSLocalizedString("albums-list.empty-state-title", bundle: bundle, comment: "")
      }

      /// Value: View photo
      static func viewPhotoTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("view-photo.title", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "view-photo.title"
        }

        return NSLocalizedString("view-photo.title", bundle: bundle, comment: "")
      }

      /// Value: Your device has not been configured to send emails. Please sign in to your email at the default iOS Mail app.
      static func emailSendNotConfigured(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("email.send.not-configured", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "email.send.not-configured"
        }

        return NSLocalizedString("email.send.not-configured", bundle: bundle, comment: "")
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
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
