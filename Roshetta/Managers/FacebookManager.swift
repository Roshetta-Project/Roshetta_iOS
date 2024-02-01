//
//  FacebookManager.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-29.
//

import Foundation
import FacebookLogin

class FacebookManger{
    static let shared = FacebookManger()
    
    private init() { }
    
    func loginWithFacebook(completion: @escaping (Result<String, RequestError>) -> Void) {
        let manager = LoginManager()

        manager.logIn(permissions: ["public_profile","email"], from: nil) { result, error in
            
            guard error == nil else {
                completion(.failure(RequestError.facebook))
                return
            }
        
            if let userToken = AccessToken.current, !userToken.isExpired {
                let tokenString = userToken.tokenString
                completion(.success(tokenString))
            }
        }
    }
}
