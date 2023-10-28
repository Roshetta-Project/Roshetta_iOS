//
//  AuthUseCase.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation

struct AuthUseCase: AuthRepositories {
    var repo: AuthRepositories
    
    func facebookAuth() {
        repo.facebookAuth()
    }
    
    func googleAuth() {
        repo.googleAuth()
    }
    
    func appleAuth() {
        repo.appleAuth()
    }
}
