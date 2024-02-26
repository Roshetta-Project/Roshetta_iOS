//
//  GoogleManager.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-30.
//

import Foundation
import GoogleSignIn

@MainActor
class GoogleManager {
    static let shared = GoogleManager()
    
    private init() { }
    
    func login() async throws -> String {
        let user = try await GIDSignIn.sharedInstance.signIn(withPresenting: ApplicationUtilitys.rootViewController).user
        let token = user.accessToken
        let tokenString = token.tokenString
        return tokenString
    }
}

class ApplicationUtilitys {
    static var rootViewController: UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
