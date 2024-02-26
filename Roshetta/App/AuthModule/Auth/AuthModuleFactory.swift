//
//  AuthModuleFactory.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import SwiftUI

protocol AuthModuleFactoryProtocol {
    func makeView() -> any View
}

@MainActor
final class  AuthModuleFactory { 
    static let shared = AuthModuleFactory()
    @Published var isFacebook = false
    private init() {} // Prevent external initialization
}

extension AuthModuleFactory: AuthModuleFactoryProtocol {
    func makeView() -> any View {
        let repositoryDependencies = AuthRepositoryDependecies(client: AuthAPIClient(client: BaseAPIClient()))
        
        var repository: AuthRepositoryProtocol
        if isFacebook {
            print("Hello we change to facebook")
            repository = AuthRepository(dependencies: repositoryDependencies)
        } else {
            print("Hello we change to not facebook")
            repository = AuthRepository(dependencies: repositoryDependencies)
        }
        
        let useCaseDependencies = AuthUseCaseDependencies(
            dataSource: AuthDataSource(),
            repository: repository
        )
        let useCase = AuthUseCase(dependencies: useCaseDependencies)
        let viewModelDependencies = AuthViewModelDependencies(useCase: useCase)
        let viewModel = AuthViewModel(dependencies: viewModelDependencies)
        let viewDependencies = AuthViewDependencies(authViewModel: viewModel)
        let view = AuthViews(dependencies: viewDependencies)
        return view
    }
}

// MARK: - AuthViewModelDependenciesProtocol
private struct AuthViewModelDependencies: AuthViewModelDependenciesProtocol {
    var useCase: AuthUseCaseProtocol
}

// MARK: - AuthUseCaseDependenciesProtocol

private struct AuthUseCaseDependencies: AuthUseCaseDependenciesProtocol {
    var dataSource: AuthDataSourceProtocol
    var repository: AuthRepositoryProtocol
}

// MARK: - AuthViewDependenciesProtocol
private struct AuthViewDependencies: AuthViewDependenciesProtocol {
    var authViewModel: AuthViewModel
}

// MARK:  - AuthRepositoryDependenciesProtocol

private struct AuthRepositoryDependecies: AuthRepositoryDependeciesProtocol {
    var client: AuthAPIClientProtocol
}
