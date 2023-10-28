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
}
