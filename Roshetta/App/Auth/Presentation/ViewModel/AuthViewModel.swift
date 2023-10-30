//
//  AuthViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-10-28.
//

import Foundation

class AuthViewModel: ObservableObject {
    // MARK: - PROPERTYS
    static let shared = AuthViewModel()
    private var loginUseCase = AuthUseCase(repo: AuthDataSource())
    
    // MARK: - INITILIZER
    private init() { }
    
    // MARK: - FUNCTIONS
    @MainActor
    func facebookAuth() {
        Task {
            do {
                try await loginUseCase.facebookAuth()
            } catch {
                print(error)
            }
        }
    }
    
    @MainActor
    func googleAuth() {
        Task {
            do {
                try await loginUseCase.googleAuth()
            } catch {
                print(error)
            }
        }
    }
}
