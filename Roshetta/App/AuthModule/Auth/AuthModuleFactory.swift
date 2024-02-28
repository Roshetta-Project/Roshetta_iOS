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
final class  AuthModuleFactory { }

extension AuthModuleFactory: AuthModuleFactoryProtocol {
    func makeView() -> any View {
        let repositoryDependencies = AuthRepositoryDependecies(client: AuthAPIClient(client: BaseAPIClient()))
        let repository = AuthRepository(dependencies: repositoryDependencies)
        let useCaseDependencies = AuthUseCaseDependencies(
            dataSource: AuthDataSource(),
            repository: repository
        )
        let useCase = AuthUseCase(dependencies: useCaseDependencies)
        let viewModelDependencies = AuthViewModelDependencies(useCase: useCase)
        let viewModel = AuthViewModel(dependencies: viewModelDependencies)
        let viewDependencies = AuthViewDependencies(authViewModel: viewModel)
        let view = AuthView(dependencies: viewDependencies)
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
