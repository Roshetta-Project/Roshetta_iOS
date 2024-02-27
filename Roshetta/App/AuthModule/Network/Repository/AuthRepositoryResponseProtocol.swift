//
//  AuthRepositoryResponseProtocol.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

protocol AuthRepositoryDependeciesProtocol {
    var client: AuthAPIClientProtocol { get }
}

protocol LoginStrategyProtocol {
    func getUserToken() async throws -> String?
}

protocol AuthRepositoryProtocol: UsersRepositoryGettable { }

protocol UsersRepositoryGettable {
    func login(with type: LoginType) async throws -> AuthRepositoryResponseProtocol?
//    func login(loginStrategy: LoginStrategyProtocol) async throws -> AuthRepositoryResponseProtocol?
}

protocol AuthRepositoryResponseProtocol {
    var token: String? { get }
    var id: String? { get }
    var name: String? { get }
    var email: String? { get }
    var personalPhoto: String? { get }
    var medicalHistory: MedicalHistoryRepositoryResponseProtocol? { get }
}

protocol MedicalHistoryRepositoryResponseProtocol {
    var gender: Int? { get }
    var dateOfBirth: String? { get }
    var countryId: Int? { get }
    var cityId: Int? { get }
    var height: Float? { get }
    var weight: Float? { get }
    var isExerciseAvilable: Bool? { get }
    var exerciseType: Int? { get }
    var isAnyHealthProblem: Bool? { get }
    var medicine: [String]? { get }
    var isPregnant: Bool? { get }
    var isSmoker: Bool? { get }
}

struct MedicalHistoryRepositiryResponse: MedicalHistoryRepositoryResponseProtocol {
    var gender: Int?
    var dateOfBirth: String?
    var countryId: Int?
    var cityId: Int?
    var height: Float?
    var weight: Float?
    var isExerciseAvilable: Bool?
    var exerciseType: Int?
    var isAnyHealthProblem: Bool?
    var medicine: [String]?
    var isPregnant: Bool?
    var isSmoker: Bool?
}

struct AuthRepositoryResponse: AuthRepositoryResponseProtocol {
    var token: String?
    var id: String?
    var name: String?
    var email: String?
    var personalPhoto: String?
    var medicalHistory: MedicalHistoryRepositoryResponseProtocol?
}
