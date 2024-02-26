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
    
    private let useCase: AuthUseCaseProtocol
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    
    // MARK: - LIFE CYCLE
    
    init(dependencies: AuthViewModelDependenciesProtocol) {
        self.useCase = dependencies.useCase
    }
}

// MARK: - AuthViewModelProtocol
extension AuthViewModel: AuthViewModelProtocol {
    func facebookLogin() async {
        isLoading = useCase.notifyLoading()
        do {
           try await useCase.execute(type: .facebook)
            isLoading = useCase.stopLoading()
        } catch {
            isError = true
            isLoading = useCase.stopLoading()
            errorMessage = error.localizedDescription
        }
    }
    
    func googleLogin() async {
        isLoading = useCase.notifyLoading()
        do {
            try await useCase.execute(type: .google)
            isLoading = useCase.stopLoading()
        } catch {
            isError = true
            isLoading = useCase.stopLoading()
            errorMessage = error.localizedDescription
        }
    }
    
    func appleLogin() async {
        isLoading = useCase.notifyLoading()
        do {
            try await useCase.execute(type: .apple)
            isLoading = useCase.stopLoading()
        } catch {
            isError = true
            isLoading = useCase.stopLoading()
            errorMessage = error.localizedDescription
        }
    }
}
