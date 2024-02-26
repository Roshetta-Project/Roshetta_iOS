//
//  AuthViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-22.
//

import SwiftUI

protocol AuthViewModelDependenciesProtocol {
  var useCase: AuthUseCaseProtocol { get }
}

enum LoginType {
    case facebook, google, apple
}

@MainActor
final class AuthViewModel: ObservableObject {
    // MARK: - CONSTANTS
    
    
    // MARK: - PROPERTYS
    
    private let usecase: AuthUseCaseProtocol
    @Published var currentType: LoginType?
    
    // MARK: - LIFE CYCLE
    init(dependencies: AuthViewModelDependenciesProtocol) {
        self.usecase = dependencies.useCase
    }
}

// MARK: - AuthViewModelProtocol
extension AuthViewModel: AuthViewModelProtocol {
    func facebookLogin() async {
        do {
            let _ = try await usecase.execute(type: .facebook)
        } catch {
            print("Error")
        }
    }
    
    func googleLogin() async {
        do {
            let _ = try await usecase.execute(type: .google)
        } catch {
            print("Error")
        }
    }
    
    func appleLogin() async {
        do {
            let _ = try await usecase.execute(type: .apple)
        } catch {
            print("Error")
        }
    }
}
