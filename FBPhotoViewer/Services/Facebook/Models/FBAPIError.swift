//
//  FBAPIError.swift
//  FBPhotoViewer
//
//  Created by Serhii Liamtsev on 2/20/22.
//  Copyright © 2022 Serg Liamtsev. All rights reserved.
//

import Foundation

enum FBAPIError: Error, LocalizedError {
    
    case emptyResponseValues
    case unableToGetResponseData
    
    var description: String {
        switch self {
        case .emptyResponseValues:
            return "Response values is empty"
        case .unableToGetResponseData:
            return "Unable to get response data"
        }
    }
    
    var failureReason: String? {
        return self.description
    }
    
    var errorDescription: String? {
        return self.description
    }
}
