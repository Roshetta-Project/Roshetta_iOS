//
//  AuthRepository.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

struct AuthParameters: AuthParametersProtocol {
    var token: String
}


class AuthRepository: AuthRepositoryProtocol {
        
    let client: AuthAPIClientProtocol
        
    init(dependencies: AuthRepositoryDependeciesProtocol) {
        self.client = dependencies.client
    }
    
    func convert(_ response: UserNetworkResponse?) -> AuthRepositoryResponseProtocol {
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
    
    func login(with type: LoginType) async throws -> AuthRepositoryResponseProtocol? {
        /// Get user token from Tirhd Party SDKs
        
        var thirdPartyManagr: ThirdPartyManagr
        switch type {
        case .facebook:
            thirdPartyManagr = ThirdPartyManagr(loginStrategy: FacebookLogin())
        case .google:
            thirdPartyManagr = ThirdPartyManagr(loginStrategy: GoogleLogin())
        case .apple:
            thirdPartyManagr = ThirdPartyManagr(loginStrategy: FacebookLogin())
        }
        let token = try await thirdPartyManagr.getUserToken()
        
        /// Send token to backend
        
        var user: AuthRepositoryResponseProtocol?
//        user = try await convert(/*client.login(with: type, parameter: AuthParameters(token: ""))*/)
        user = convert(Bundle.main.decode("user.json"))
        return user
    }
}

class ThirdPartyManagr: LoginStrategyProtocol {
    private var loginStrategy: LoginStrategyProtocol

    init(loginStrategy: LoginStrategyProtocol) {
        self.loginStrategy = loginStrategy
    }
    
    func getUserToken() async throws -> String? {
        return try await loginStrategy.getUserToken()
    }
}

class FacebookLogin: LoginStrategyProtocol {
    let manager = FacebookManger.shared
    
    func getUserToken() async throws -> String? {
        let userToken = try await manager.getUserToken()
        return userToken
    }
}

class GoogleLogin: LoginStrategyProtocol {
    let manager = GoogleManager.shared

    func getUserToken() async throws -> String? {
        let userToken = try await manager.getUserToken()
        return userToken
    }
}

class AppleLogin: LoginStrategyProtocol {
    func getUserToken() async throws -> String? {
        return nil
    }
}
