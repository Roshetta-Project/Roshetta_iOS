//
//  AuthDataSource.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation

//struct AuthDataSource: AuthRepositories {
//    
//    private var services: AuthServices
//    
//    init() {
//        self.services = AuthServices()
//    }
//    
//    @MainActor
//    func facebookAuth() async throws {
//        FacebookManger.shared.loginWithFacebook { result in
//            switch result {
//            case .success(let token):
//                print("user token is \(token)")
//                Task {
//                    try await services.facebookAuth(token: token)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//    
//    func googleAuth() async throws {
//        let token = try await GoogleManager.shared.loginWithGoogle()
//        print("user token \(token)")
//        try await services.googleAuth(token: token)
//    }
//    
//    func appleAuth() {
//        // Logic in here
//    }
//}
