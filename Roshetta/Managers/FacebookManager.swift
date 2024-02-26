//
//  FacebookManager.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-29.
//

import Foundation
import FacebookLogin

@MainActor
class FacebookManger{
    static let shared = FacebookManger()
    
    private init() { }
        
    func login() async throws -> String {
        let manager = LoginManager()

        do {
            let token = try await withCheckedThrowingContinuation { continuation in
                manager.logIn(permissions: ["public_profile","email"], from: nil) { result, error in
                    if error == nil {
                        if let userToken = AccessToken.current, !userToken.isExpired {
                            let tokenString = userToken.tokenString
                            continuation.resume(returning: tokenString)
                        }

                    } else {
                        continuation.resume(throwing: RequestError.facebook)
                    }
                }
            }
            return token
        } catch {
            throw error
        }
    }
}
