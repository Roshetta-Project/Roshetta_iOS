//
//  ClinicModel.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 20/06/2024.
//

import Foundation

// MARK: - ClinicListModel

struct ClinicListModel: Codable {
    let data: [ClinicModel]
}

// MARK: - ClinicModel

struct ClinicModel: Codable, Identifiable {
    let id: String
    let logo: String
    let name: String
    let clinicPhotos: [String]
    let specilization: String
    let price: Int
    let location: String
    let isfavourite: Bool
    let ratingsAverage: Double
}
