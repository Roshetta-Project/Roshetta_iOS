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


struct AuthRepository: AuthRepositoryProtocol {
        
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
}

extension AuthRepository {
    func loginWithFacebook() async throws -> AuthRepositoryResponseProtocol? {
        do {
            var user: AuthRepositoryResponseProtocol?
            let token = try await FacebookManger.shared.login()
            let parameters: AuthParametersProtocol = AuthParameters(token: token)
            user =  try await convert(client.facebookAuth(parameter: parameters))
            return user
        } catch {
            guard let error = error as? SessionDataTaskError else {
                throw RequestError.unknown
            }
            throw RepositoryError(error: error)
        }
    }
}

extension AuthRepository {
    func loginWithGoogle() async throws -> AuthRepositoryResponseProtocol? {
        do {
            var user: AuthRepositoryResponseProtocol?
            let token = try await GoogleManager.shared.login()
            let parameters: AuthParametersProtocol = AuthParameters(token: token)
            user =  try await convert(client.facebookAuth(parameter: parameters))
            return user
        } catch {
            guard let error = error as? SessionDataTaskError else {
                throw RequestError.unknown
            }
            throw RepositoryError(error: error)
        }
    }
}

extension AuthRepository {
    func loginWithApple() async throws -> AuthRepositoryResponseProtocol? {
        return nil
    }
}


protocol TesetLogin {
    func login()
}

class FBLogin: TesetLogin {
    func login() {
        print("Hello FB")
    }
}

class GoogleLogin: TesetLogin {
    func login() {
        print("Hello FB")
    }
}

class LoginManagerr {
    private var loginStratgy: TesetLogin
    
    init(loginStratgy: TesetLogin) {
        self.loginStratgy = loginStratgy
    }
    
    func changeStratgy(loginStratgy: TesetLogin) {
        self.loginStratgy = loginStratgy
    }
    
    func login() {
        loginStratgy.login()
    }
}
