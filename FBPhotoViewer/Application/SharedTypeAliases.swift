//
//  SharedTypeAliases.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 5/3/21.
//  Copyright © 2021 Serg Liamtsev. All rights reserved.
//

import UIKit

typealias TypeClosure<T> = (T) -> Void

typealias VoidClosure = () -> Void
typealias VoidResultClosure = (Swift.Result<Void, Error>) -> Void

typealias TypeResult<T> = Swift.Result<T, Error>
typealias ResultClosure<T> = (Swift.Result<T, Error>) -> Void

public typealias DataUpdateInfo = [String: [String: Any]]
