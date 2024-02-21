//
//  AuthUseCaseProtocol.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

protocol AuthUseCaseProtocol {
    func facebookAuth(parameters: AuthParametersProtocol) async throws -> UserProtocol?
    func googleAuth(parameters: AuthParametersProtocol) async throws -> UserProtocol?
    func appleAuth(parameters: AuthParametersProtocol) async throws -> UserProtocol?
}

protocol UserProtocol {
    var token: String { get }
    var id: String { get }
    var name: String { get }
    var email: String { get }
    var personalPhoto: String { get }
    var medicalHistory: MedicalHistoryProtocol { get }
}

protocol MedicalHistoryProtocol {
    var gender: Int { get }
    var dateOfBirth: String { get }
    var country: Int { get }
    var city: Int { get }
    var height: Float { get }
    var weight: Float { get }
    var isExerciseAvilable: Bool { get }
    var exerciseType: Int { get }
    var isAnyHealthProblem: Bool { get }
    var medicine: [String] { get }
    var isPregnant: Bool { get }
    var isSmoker: Bool { get }
}
