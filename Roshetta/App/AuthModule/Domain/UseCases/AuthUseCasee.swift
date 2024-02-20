//
//  AuthUseCase.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation

struct AuthUseCase: AuthRepositories {
    var repo: AuthRepositories
    
    func facebookAuth() async throws {
        try await repo.facebookAuth()
    }
    
    func googleAuth() async throws {
        try await repo.googleAuth()
    }
    
    func appleAuth() {
        repo.appleAuth()
    }
}
