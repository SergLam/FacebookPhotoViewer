//
//  FBGraphAPIManager.swift
//  FBPhotoViewer
//
//  Created by Serg Liamtsev on 3/13/19.
//  Copyright © 2019 Serg Liamtsev. All rights reserved.
//

import FBSDKCoreKit
import Foundation

final class FBGraphAPIManager: FBGraphAPIManagerProtocol {
    
    var decoder: JSONDecoder = JSONDecoder()
    
    init() {
        decoder.dateDecodingStrategy = .formatted(DateFormatter.feedPostDateTime)
    }
    
    func getUserProfile(completion: @escaping ResultClosure<UserJSON>) {
        let request = GetMyProfileRequest()
        let graphRequest = GraphRequest(graphPath: request.path, parameters: request.parameters)
        graphRequest.start(completion: { [weak self] _, result, error in
            guard let `self` = self else { return }
            guard let error = error else {
                guard let result = result else {
                    completion(.failure(FBAPIError.emptyResponseValues))
                    return
                }
                guard let jsonDictionary = result as? [String: Any] else {
                    completion(.failure(FBAPIError.unableToGetResponseData))
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: [AppConstants.prettyJsonOptions])
                    let user = try self.decoder.decode(UserJSON.self, from: jsonData)
                    completion(.success(user))
                } catch {
                    completion(.failure(error))
                }
                return
            }
            completion(.failure(error))
        })
    }
    
    // TODO: - Add pagination
    func getUserAlbums(completion: @escaping ResultClosure<GetMyPhotoAlbumsResponse>) {
        
        let request = GetMyPhotoAlbumsRequest()
        let graphRequest = GraphRequest(graphPath: request.path, parameters: request.parameters)
        graphRequest.start(completion: { [weak self] _, result, error in
            
            guard let `self` = self else { return }
            guard let error = error else {
                guard let result = result else {
                    completion(.failure(FBAPIError.emptyResponseValues))
                    return
                }
                guard let jsonDictionary = result as? [String: Any] else {
                    completion(.failure(FBAPIError.unableToGetResponseData))
                    return
                }
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: [AppConstants.prettyJsonOptions])
                    let response = try self.decoder.decode(GetMyPhotoAlbumsResponse.self, from: jsonData)
                    completion(.success(response))
                } catch {
                    completion(.failure(error))
                }
                return
            }
            completion(.failure(error))
        })
    }
    
}
