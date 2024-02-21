//
//  UserNetworkResponse.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-02-04.
//

import Foundation

struct UserNetworkResponse: Codable {
    var token: String?
    var id: String?
    var name: String?
    var email: String?
    var personalPhoto: String?
    var medicalHistory: MedicalHistoryResponseModel?
}

struct MedicalHistoryResponseModel: Codable {
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
