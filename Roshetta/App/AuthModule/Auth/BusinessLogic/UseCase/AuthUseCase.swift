//
//  AuthUseCase.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

protocol AuthUseCaseDependenciesProtocol {
    var dataSource: AuthDataSourceProtocol { get }
    var repository: AuthRepositoryProtocol { get }
}

final class AuthUseCase {
    // MARK: - PROPERTYS
    
    private var dataSource: AuthDataSourceProtocol
    private let repository: AuthRepositoryProtocol

    // MARK: - INIT
    
    init(dataSource: AuthDataSourceProtocol, repository: AuthRepositoryProtocol) {
        self.dataSource = dataSource
        self.repository = repository
    }
    
    // MARK: - Privates
    
    private func convert(_ response: AuthRepositoryResponseProtocol) -> UserProtocol {
        return UserItem(token: response.token ?? "",
                        id: response.id ?? "",
                        name: response.name ?? "",
                        email: response.email ?? "",
                        personalPhoto: response.personalPhoto ?? "",
                        medicalHistory: 
                            MedicalHistoryItem(gender: response.medicalHistory?.gender ?? 0,
                                               dateOfBirth: response.medicalHistory?.dateOfBirth ?? "",
                                               country: response.medicalHistory?.countryId ?? 0,
                                               city: response.medicalHistory?.cityId ?? 0,
                                               height: response.medicalHistory?.height ?? 0.0,
                                               weight: response.medicalHistory?.weight ?? 0.0,
                                               isExerciseAvilable: response.medicalHistory?.isExerciseAvilable ?? false,
                                               exerciseType: response.medicalHistory?.exerciseType ?? 0,
                                               isAnyHealthProblem: response.medicalHistory?.isAnyHealthProblem ?? false,
                                               medicine: response.medicalHistory?.medicine ?? [],
                                               isPregnant: response.medicalHistory?.isPregnant ?? false,
                                               isSmoker: response.medicalHistory?.isSmoker ?? false
                                              )
        )
    }
}


// MARK: - AuthUseCaseProtocol

extension AuthUseCase: AuthUseCaseProtocol {
    func facebookAuth(parameters: AuthParametersProtocol) async throws -> UserProtocol? {
        guard let user = try await repository.facebookAuth(parameters: parameters) else { return nil }
        dataSource.user = convert(user)
        dataSource.isLoading = false
        return dataSource.user
    }
    
    func googleAuth(parameters: AuthParametersProtocol) async throws -> UserProtocol? {
        guard let user = try await repository.facebookAuth(parameters: parameters) else { return nil }
        dataSource.user = convert(user)
        dataSource.isLoading = false
        return dataSource.user
    }
    
    func appleAuth(parameters: AuthParametersProtocol) async throws -> UserProtocol? {
        guard let user = try await repository.facebookAuth(parameters: parameters) else { return nil }
        dataSource.user = convert(user)
        dataSource.isLoading = false
        return dataSource.user
    }
}

// MARK: - User item protocol

private struct UserItem: UserProtocol {
    var token: String
    var id: String
    var name: String
    var email: String
    var personalPhoto: String
    var medicalHistory: MedicalHistoryProtocol
}

private struct MedicalHistoryItem: MedicalHistoryProtocol {
    var gender: Int
    var dateOfBirth: String
    var country: Int
    var city: Int
    var height: Float
    var weight: Float
    var isExerciseAvilable: Bool
    var exerciseType: Int
    var isAnyHealthProblem: Bool
    var medicine: [String]
    var isPregnant: Bool
    var isSmoker: Bool
}

private struct AuthParameters: AuthParametersProtocol {
    var token: String
}
