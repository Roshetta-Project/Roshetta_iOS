//
//  AuthRepository.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

protocol AuthRepositoryDependeciesProtocol {
    var client: AuthAPIClientProtocol { get }
}

struct AuthRepository {
    
    private let client: AuthAPIClientProtocol
    
    init(dependencies: AuthRepositoryDependeciesProtocol) {
        self.client = dependencies.client
    }
    
    private func convert(_ response: UserNetworkResponse?) -> AuthRepositoryResponseProtocol {
        return AuthRepositoryResponse(
            token: response?.token,
            id: response?.id,
            name: response?.name,
            email: response?.email,
            personalPhoto: response?.personalPhoto,
            medicalHistory: MedicalHistoryRepositiryResponse(
                gender: response?.medicalHistory?.gender,
                dateOfBirth: response?.medicalHistory?.dateOfBirth,
                countryId: response?.medicalHistory?.countryId,
                cityId: response?.medicalHistory?.cityId,
                height: response?.medicalHistory?.height,
                weight: response?.medicalHistory?.weight,
                isExerciseAvilable: response?.medicalHistory?.isExerciseAvilable,
                exerciseType: response?.medicalHistory?.exerciseType,
                isAnyHealthProblem: response?.medicalHistory?.isAnyHealthProblem,
                medicine: response?.medicalHistory?.medicine,
                isPregnant: response?.medicalHistory?.isPregnant,
                isSmoker: response?.medicalHistory?.isSmoker
            )
        )
    }
}

extension AuthRepository: AuthRepositoryProtocol {
    
    private enum AuthProvider {
        case facebook
        case google
        case apple
    }

    private func authenticate(provider: AuthProvider, parameters: AuthParametersProtocol) async throws -> AuthRepositoryResponseProtocol? {
        var user: AuthRepositoryResponseProtocol?
        do {
            switch provider {
                case .facebook:
                    user = try await convert(client.facebookAuth(parameter: parameters))
                case .google:
                    user = try await convert(client.googleAuth(parameter: parameters))
                case .apple:
                    user = try await convert(client.appleAuth(parameter: parameters))
            }
        } catch {
            guard let error = error as? SessionDataTaskError else {
                throw RequestError.unknown
            }
            throw RepositoryError(error: error)
        }
        return user
    }
    
    func facebookAuth(parameters: AuthParametersProtocol) async throws -> AuthRepositoryResponseProtocol? {
        try await authenticate(provider: .facebook, parameters: parameters)
    }
    
    func googleAuth(parameters: AuthParametersProtocol) async throws -> AuthRepositoryResponseProtocol? {
        try await authenticate(provider: .google, parameters: parameters)
    }
    
    func appleAuth(parameters: AuthParametersProtocol) async throws -> AuthRepositoryResponseProtocol? {
        try await authenticate(provider: .apple, parameters: parameters)
    }
}
