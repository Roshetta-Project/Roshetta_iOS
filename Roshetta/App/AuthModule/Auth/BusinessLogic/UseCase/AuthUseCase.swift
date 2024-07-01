//
//  AuthUseCase.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

class AuthUseCase {

    // MARK: - PROPERTYS
    
    private var dataSource: AuthDataSourceProtocol
    private let repository: AuthRepositoryProtocol
    
    // MARK: - INITILIZER
    
    init(dependencies: AuthUseCaseDependenciesProtocol) {
        self.dataSource = dependencies.dataSource
        self.repository = dependencies.repository
    }

    // MARK: - Privates
    
//    private func convert(_ response: AuthRepositoryResponseProtocol) -> UserProtocol {
//        return UserItem(
//            token: response.token ?? "",
//            id: response.id ?? "",
//            name: response.name ?? "",
//            email: response.email ?? "",
//            personalPhoto: response.personalPhoto ?? "",
//            medicalHistory:
//                MedicalHistoryItem(
//                    gender: response.medicalHistory?.gender ?? 0,
//                    dateOfBirth: response.medicalHistory?.dateOfBirth ?? "",
//                    country: response.medicalHistory?.countryId ?? 0,
//                    city: response.medicalHistory?.cityId ?? 0,
//                    height: response.medicalHistory?.height ?? 0.0,
//                    weight: response.medicalHistory?.weight ?? 0.0,
//                    isExerciseAvilable: response.medicalHistory?.isExerciseAvilable ?? false,
//                    exerciseType: response.medicalHistory?.exerciseType ?? 0,
//                    isAnyHealthProblem: response.medicalHistory?.isAnyHealthProblem ?? false,
//                    medicine: response.medicalHistory?.medicine ?? [],
//                    isPregnant: response.medicalHistory?.isPregnant ?? false,
//                    isSmoker: response.medicalHistory?.isSmoker ?? false
//                )
//        )
//    }
}

extension AuthUseCase: AuthUseCaseProtocol {
    func execute(type: LoginType) async throws {
        do {
            dataSource.isLoading = true
            var user: AuthRepositoryResponseProtocol?
            user = try await repository.login(with: type)
            guard let user = user else { throw RequestError.notAllowed }
//            dataSource.user = convert(user)
            dataSource.isLoading = false
        } catch {
            dataSource.isLoading = false
            throw error
        }
    }
}

extension AuthUseCase {
    func notifyLoading() -> Bool {
        dataSource.isLoading
    }
    
    func stopLoading() -> Bool {
        dataSource.isLoading
    }
}

// MARK: - User item protocol
 
struct UserItem: UserProtocol {
    var token: String
    var id: String
    var name: String
    var email: String
    var personalPhoto: String
    var medicalHistory: MedicalHistoryProtocol
}

//private struct MedicalHistoryItem: MedicalHistoryProtocol {
//    var gender: Int
//    var dateOfBirth: String
//    var country: Int
//    var city: Int
//    var height: Float
//    var weight: Float
//    var isExerciseAvilable: Bool
//    var exerciseType: Int
//    var isAnyHealthProblem: Bool
//    var medicine: [String]
//    var isPregnant: Bool
//    var isSmoker: Bool
//}
