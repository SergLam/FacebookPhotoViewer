//
//  LocaleRefreshable.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 03.05.2021.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

@objc
protocol LocaleRefreshable {
    
    // NOTE: - Required to change locale in runtime
    func subscribeToLocaleChangeNotification()
    @objc
    func refreshLocale()
}
